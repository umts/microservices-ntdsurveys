require 'rails_helper'

describe SurveyTripStopsController do 
  describe 'GET #index' do 
    it 'renders the template' do 
      get :index
      expect(response).to render_template survey_trip_stops_path
    end 
  end

  describe 'GET #show' do 
    it 'renders the template' do 
      survey_trip_stop = create :survey_trip_stop
      get :show, params: { id: survey_trip_stop.id }
      expect(response).to render_template survey_trip_stop_path
      expect(assigns[:survey_trip_stop]).to be survey_trip_stop
    end
  end

  describe 'GET #new' do 
    it 'renders the template' do 
      get :new
      expect(response).to render_template new_survey_trip_stop_path
    end
  end

  describe 'POST #create' do 
    let(:submit) { post :create, params: { location: 'Haigus Mall' } }
    it 'creates the survey' do 
      expect{submit}.to change{SurveyTripStop.count}.by 1
    end
  end

  describe 'GET #edit' do 
    it 'renders the template' do
      survey_trip_stop = create :survey_trip_stop
      get :edit, params: { id: survey_trip_stop.id }
      expect(response).to render_template edit_survey_trip_stop_path
      expect(assigns[:survey_trip_stop]).to be survey_trip_stop 
    end
  end

  describe 'PUT #update' do 
    it 'updates the survey' do 
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
