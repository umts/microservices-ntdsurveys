require 'rails_helper'

describe SurveyTripStop do
  describe 'formatted_time' do
    it 'returns military time' do
      time = DateTime.current
      sts = create :survey_trip_stop, time: time
      expect(sts.formatted_time).to eql time.strftime('%H:%M')
    end
  end

  describe 'date' do
    it 'returns date of sts' do
      date = DateTime.current
      sts = create :survey_trip_stop, time: date
      expect(sts.date).to eql date.strftime('%m/%d/%Y')
    end
  end
end
