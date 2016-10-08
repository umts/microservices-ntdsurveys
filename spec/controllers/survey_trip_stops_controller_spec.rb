require 'rails_helper'

describe SurveyTripStopsController do 
  describe 'GET #edit' do 
    it 'renders the template' do
      survey_trip_stop = create :survey_trip_stop
      get :edit, params: { id: survey_trip_stop.id }
      expect(response).to render_template :edit
      expect(assigns[:survey_trip_stop]).to eq survey_trip_stop 
    end
  end

  describe 'PUT #update' do 
    it 'updates the survey' do 
      survey_trip_stop = create :survey_trip_stop, boarded: 1, alighted: 1 
      put :update, params: { id: survey_trip_stop.id, 
                            survey_trip_stop: { boarded: 0, alighted: 0 } }
      survey_trip_stop.reload
      expect(survey_trip_stop.boarded).to eql 0
      expect(survey_trip_stop.alighted).to eql 0
    end
  end

  describe 'DELETE #destroy' do 
    let!(:survey_trip_stop) { create :survey_trip_stop }
    let(:submit) { delete :destroy, params: { id: survey_trip_stop.id } }
    it 'will destroy the survey' do 
      expect{submit}.to change{SurveyTripStop.count}.by -1
    end
  end
end
