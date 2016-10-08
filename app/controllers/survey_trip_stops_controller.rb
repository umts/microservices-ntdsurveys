class SurveyTripStopsController < ApplicationController
  def edit
    @survey_trip_stop = SurveyTripStop.find(params[:id])
  end

  def update
    survey_trip_stop = SurveyTripStop.find(params[:id])
    if survey_trip_stop.update(params[:survey_trip_stop])
      flash[:notice] = 'Successfully updated survey trip stop.'
    else
      flash[:alert] = survey_trip_stop.errors.full_messages
    end
    redirect_to edit_survey_trip_stop_path(survey_trip_stop.id)
  end

  def destroy
    survey_trip_stop = SurveyTripStop.find(params[:id])
    if survey_trip_stop.destroy
      flash[:notice] = 'Successfully deleted survey trip stop.'
    else
      flash[:alert] = survey_trip_stop.errors.full_messages
    end
  end
end
