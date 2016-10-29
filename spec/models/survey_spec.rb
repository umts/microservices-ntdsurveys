require 'rails_helper'

describe Survey do
  describe 'formatted_date' do
    it 'returns the formatted date' do
      date = DateTime.current
      survey = create :survey, date: date
      expect(survey.formatted_date).to eql date.strftime('%m/%d/%Y')
    end
  end

  describe 'time' do
    it 'returns the military time' do
      time = DateTime.current
      survey = create :survey, date: time
      expect(survey.time).to eql time.strftime('%H:%M')
    end
  end

  describe 'location' do
    it 'returns the first sts location' do
      survey = create :survey
      create :survey_trip_stop, survey_id: survey.id,
                                location: 'Haigus Mall', sequence_number: 2
      sts = create :survey_trip_stop, survey_id: survey.id,
                                      location: 'Fine Arts Center',
                                      sequence_number: 1
      expect(survey.location).to eql sts.location
    end
  end
end
