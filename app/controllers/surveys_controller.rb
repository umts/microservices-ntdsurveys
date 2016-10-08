class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    survey = Survey.find(params[:id])
    if survey.update(survey_params)
      flash[:notice] = 'Successfully updated survey.'
    else
      flash[:alert] = survey.errors.full_messages
    end
    redirect_to surveys_path
  end

  def destroy
    survey = Survey.find(params[:id])
    if survey.destroy
      flash[:notice] = 'Successfully deleted survey.'
    else
      flash[:alert] = survey.errors.full_messages
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:starting_pax)
  end
end
