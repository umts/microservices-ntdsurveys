require 'rails_helper'

describe SurveysController do
  describe 'DELETE #destroy' do
    let!(:survey) { create :survey }
    let(:submit) { delete :destroy, params: { id: survey.id } }
    context 'without survey trip stops' do
      it 'will delete the survey' do
        expect { submit }.to change(Survey, :count).by(-1)
      end
    end
    context 'with survey trip stops' do
      it 'will delete the survey and its trip stops' do
        create :survey_trip_stop, survey_id: survey.id
        expect { submit }.to change(Survey, :count).by(-1)
          .and change(SurveyTripStop, :count).by(-1)
      end
    end
  end

  describe 'GET #index' do
    it 'renders the template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #generate' do
    it 'renders the template' do
      get :generate
      expect(response).to render_template :generate
    end
  end

  describe 'GET #pdf' do
    it 'will render the pdf' do
      survey = create :survey, printed: false
      create :survey_trip_stop, survey_id: survey.id
      get :pdf, params: { surveys: [survey.id] }
      expect(survey.reload).to be_printed
    end
  end

  describe 'GET #show' do
    it 'renders the template' do
      survey = create :survey
      get :show, params: { id: survey.id }
      expect(response).to render_template :show
      expect(assigns[:survey]).to eq survey
    end
  end

  describe 'PUT #update' do
    it 'updates the survey' do
      survey = create :survey, starting_pax: 3
      put :update, params: { id: survey.id, survey: { starting_pax: 1 } }
      survey.reload
      expect(survey.starting_pax).to be 1
    end
  end
end
