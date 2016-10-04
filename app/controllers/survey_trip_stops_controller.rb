class SurveyTripStopsController < ApplicationController
  def show
    @survey_trip_stop = SurveyTripStop.find(params[:id])
  end

  def new
    @survey_trip_stop = Survey.new
  end

  def create
    survey_trip_stop = Survey.new(params[:survey_trip_stop])
    survey_trip_stop.save
  end

  def edit
    @survey_trip_stop = Survey.find(params[:id])
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
