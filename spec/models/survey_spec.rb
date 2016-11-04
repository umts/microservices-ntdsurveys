require 'rails_helper'

describe Survey do
  let(:date) { Time.zone.parse('2010-10-10 7:30') }
  let(:survey) { create :survey, date: date }
  describe 'formatted_date' do
    it 'returns the formatted date' do
      expect(survey.formatted_date).to eql '10/10/2010'
    end
  end

  describe 'time' do
    it 'returns the military time' do
      expect(survey.time).to eql '07:30'
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
end
