require 'rails_helper'

describe Survey do
  context 'formatting methods' do
    let(:date) { Time.zone.parse('2010-10-10 7:30') }
    let(:survey) { create :survey, date: date }

    describe 'formatted_date' do
      it 'returns the formatted date' do
        expect(survey.formatted_date).to eql 'Sunday, October 10, 2010'
      end
    end

    describe 'time' do
      it 'returns the military time' do
        expect(survey.time).to eql '7:30 am'
      end
    end
  end

  describe 'location' do
    it 'returns the first sts location' do
      survey = create :survey
      create :survey_trip_stop, survey_id: survey.id,
                                location: 'Haigis Mall', sequence_number: 2
      create :survey_trip_stop, survey_id: survey.id,
                                location: 'Fine Arts Center',
                                sequence_number: 1
      expect(survey.location).to eql 'Fine Arts Center'
    end
  end

  describe 'self.generate_ntd' do
    let :trip_attributes do
      { datetime: '2017-02-01T14:15:00-05:00',
        shift: '30-1 PM1',
        trip_stops: [trip_stop_attributes] }
    end
    let :trip_stop_attributes do
      { distance: 0.307,
        datetime: '2017-02-01T14:20:00-05:00',
        sequence_number: 1,
        location: location_attributes }
    end
    let :location_attributes do
      { name: 'Old Belchertown Road',
        is_public: true }
    end
    let :data do
      { trips: [trip_attributes] }.to_json
    end
    let :dates do
      { start_date: '02/01/2017', end_date: '02/28/2017' }
    end
    let :call do
      Survey.generate_ntd dates.merge(daily_count: 3)
    end
    before do
      expect(MicroservicesEngine).to receive(:get).with(
        :trips, :generate_random_trips, dates.merge(count_per_day: 3))
        .and_return data
    end
    it 'makes a call to the trip service and creates the objects as received' do
      expect { call }
        .to change(Survey, :count).by(1)
        .and change(SurveyTripStop, :count).by(1)
      expect(Survey.last).to have_attributes(
        date: DateTime.iso8601(trip_attributes[:datetime]),
        shift: trip_attributes[:shift]
      )
      expect(SurveyTripStop.last).to have_attributes(
        miles_from_previous: trip_stop_attributes[:distance],
        time: DateTime.iso8601(trip_stop_attributes[:datetime]),
        sequence_number: trip_stop_attributes[:sequence_number],
        location: location_attributes[:name]
      )
    end
    it 'attaches the trip stop to the survey' do
      call
      expect(SurveyTripStop.last.survey).to eql Survey.last
    end
  end
end
