class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end

  def create
    survey = Survey.new(params[:survey])
    if survey.save
      flash[:notice] = "Successfully created survey."
    else
      flash[:alert] = survey.errors.full_messages
    end
    redirect_to new_survey_path
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    survey = Survey.find(params[:id])
    if survey.update(params[:survey])
      flash[:notice] = "Successfully updated survey."
    else
      flash[:alert] = survey.errors.full_messages
    end
    redirect_to edit_survey_path
  end

  def destroy
    survey = Survey.find(params[:id])
    survey.destroy
  end
end
