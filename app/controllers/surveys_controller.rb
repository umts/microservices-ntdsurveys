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
    survey.save
  end

  def edit
    @survey = Survey.find(params[:id])
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
