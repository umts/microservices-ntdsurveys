require 'rails_helper'

describe SurveysController do
  describe 'GET #index' do
    it 'renders the template' do
      get :index
      expect(response).to render_template surveys_path
    end
  end

  describe 'GET #show' do
    it 'renders the template' do
      survey = create :survey
      get :show, params: { id: survey.id }
      expect(response).to render_template survey_path
      expect(assigns[:survey]).to be survey
    end
  end

  describe 'GET #new' do
    it 'renders the template' do
      get :new
      expect(response).to render_template new_survey_path
    end
  end

  describe 'POST #create' do
    let(:submit) { post :create, params: { survey: { starting_pax: 1 } } }
    it 'creates the survey' do
      expect { submit }.to change { Survey.count }.by 1
    end
  end

  describe 'GET #edit' do
    it 'renders the template' do
      survey = create :survey
      get :edit, params: { id: survey.id }
      expect(response).to render_template edit_survey_path
      expect(assigns[:survey]).to be survey
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
