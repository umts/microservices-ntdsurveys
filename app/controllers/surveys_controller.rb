class SurveysController < ApplicationController
  def index
    if params[:completed].present?
      if params[:completed] == 'true' ? @completed = true : @completed = false
      end
      @surveys = Survey.where(completed: @completed)
                       .paginate(page: params[:page], per_page: 25)
    else
      @surveys = Survey.all.paginate(page: params[:page], per_page: 25)
      @completed = false
    end
    cookies[:page] = params[:page]
    cookies[:completed] = params[:completed]
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

  def PDF
    surveys = Survey.find(params[:surveys]).sort_by(&:date)
    surveys.each { |survey| survey.update printed: true }
    pdf = SurveyPdf.new(surveys)
    send_data pdf.render, filename: "Survey #{DateTime.current}.pdf",
                          type: 'application/pdf', disposition: 'inline'
  end

  private

  def survey_params
    params.require(:survey).permit(:starting_pax, :completed,
                                   survey_trip_stops_attributes: [:id, :boarded,
                                                                  :alighted])
  end
end
