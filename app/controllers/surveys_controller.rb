class SurveysController < ApplicationController
  def index
    @surveys = Survey.all.paginate(page: params[:page], per_page: 6)
    cookies[:page] = params[:page]
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def update
    survey = Survey.find(params[:id])
    if survey.update(survey_params)
      flash[:notice] = 'Successfully updated survey.'
    else
      flash[:alert] = survey.errors.full_messages
    end
    redirect_to surveys_path(page: cookies[:page])
  end

  def destroy
    survey = Survey.find(params[:id])
    if survey.destroy
      flash[:notice] = 'Successfully deleted survey.'
    else
      flash[:alert] = survey.errors.full_messages
    end
    redirect_to surveys_path(page: cookies[:page])
  end

  private

  def survey_params
    params.require(:survey).permit(:starting_pax, :completed,
                                   survey_trip_stops_attributes: [:id, :boarded,
                                                                  :alighted])
  end
end
