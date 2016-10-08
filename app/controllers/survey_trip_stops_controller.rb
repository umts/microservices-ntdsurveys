class SurveyTripStopsController < ApplicationController
  def edit
    @survey_trip_stop = SurveyTripStop.find(params[:id])
  end

  def update
    survey_trip_stop = SurveyTripStop.find(params[:id])
    if survey_trip_stop.update(survey_trip_stop_params)
      flash[:notice] = 'Successfully updated survey trip stop.'
    else
      flash[:alert] = survey_trip_stop.errors.full_messages
    end
    redirect_to survey_path(survey_trip_stop.survey_id)
  end

  def destroy
    survey_trip_stop = SurveyTripStop.find(params[:id])
    if survey_trip_stop.destroy
      flash[:notice] = 'Successfully deleted survey trip stop.'
    else
      flash[:alert] = survey_trip_stop.errors.full_messages
    end
  end

  private

  def survey_trip_stop_params
    params.require(:survey_trip_stop).permit(:boarded, :alighted)
  end
end
