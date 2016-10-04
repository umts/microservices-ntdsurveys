class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    survey = Survey.find(params[:id])
    survey.update(params[:survey])
  end

  def destroy
    survey = Survey.find(params[:id])
    survey.destroy
  end
end
