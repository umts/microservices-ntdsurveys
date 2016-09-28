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
  end

  def destroy
  end
end
