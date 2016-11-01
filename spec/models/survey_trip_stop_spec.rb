require 'rails_helper'

describe SurveyTripStop do
  describe 'formatted_time' do
    it 'returns military time' do
      time = Time.zone.parse('2009-4-20 14:45')
      sts = create :survey_trip_stop, time: time
      expect(sts.formatted_time).to eql '14:45'
    end
  end

  describe 'date' do
    it 'returns date of sts' do
      date = Time.zone.parse('2009-4-20 14:45')
      sts = create :survey_trip_stop, time: date
      expect(sts.date).to eql '04/20/2009'
    end
  end
end
