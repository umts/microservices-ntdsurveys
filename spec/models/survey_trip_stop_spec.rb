require 'rails_helper'

describe SurveyTripStop do
  let(:time) { Time.zone.parse('2009-4-20 14:45') }
  let(:sts) { create :survey_trip_stop, time: time }
  describe 'formatted_time' do
    it 'returns military time' do
      expect(sts.formatted_time).to eql '14:45'
    end
  end

  describe 'date' do
    it 'returns date of sts' do
      expect(sts.date).to eql '04/20/2009'
    end
  end
end
