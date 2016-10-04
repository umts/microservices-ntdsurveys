class SurveyTripStopsController < ApplicationController
  def show
    @survey_trip_stop = SurveyTripStop.find(params[:id])
  end

  def new
    @survey_trip_stop = Survey.new
  end

  def create
    survey_trip_stop = Survey.new(params[:survey_trip_stop])
    if survey_trip_stop.save
      flash[:notice] = "Successfully created survey."
    else
      flash[:alert] = survey_trip_stop.errors.full_messages
    end
    redirect_to new_survey_trip_stop_path
  end

  def edit
    @survey_trip_stop = Survey.find(params[:id])
  end

  def update
    survey_trip_stop = SurveyTripStop.find(params[:id])
    if survey_trip_stop.update(params[:survey_trip_stop])
      flash[:notice] = "Successfully updated survey."
    else
      flash[:alert] = survey_trip_stop.errors.full_messages
    end
    redirect_to edit_survey_trip_stop_path(survey_trip_stop.id)
  end

  def destroy
    survey_trip_stop = SurveyTripStop.find(params[:id])
    survey_trip_stop.destroy
  end
end
