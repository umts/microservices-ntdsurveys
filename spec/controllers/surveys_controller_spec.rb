require 'rails_helper'

describe SurveysController do
  describe 'GET #index' do
    it 'renders the template' do
      get :index
      expect(response).to render_template :index
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
      expect(survey.starting_pax).to eql 1
    end
  end

  describe 'DELETE #destroy' do
    let!(:survey) { create :survey }
    let(:submit) { delete :destroy, params: { id: survey.id } }
    it 'will destroy the survey' do
      expect { submit }.to change { Survey.count }.by -1
    end
  end
end
