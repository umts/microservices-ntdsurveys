class SurveyTripStopsController < ApplicationController
  def show
    @survey_trip_stop = SurveyTripStop.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    survey_trip_stop = SurveyTripStop.find(params[:id])
    survey_trip_stop.update(params[:survey_trip_stop])
  end

  def destroy
    survey_trip_stop = SurveyTripStop.find(params[:id])
    survey_trip_stop.destroy
  end
end
