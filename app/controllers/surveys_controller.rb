class SurveysController < ApplicationController
  before_action :find_survey, only: %i(destroy show update)

  def destroy
    if @survey.destroy
      flash[:notice] = 'Successfully deleted survey.'
    else
      flash[:alert] = @survey.errors.full_messages
    end
    redirect_to surveys_path(page: cookies[:page],
                             completed: cookies[:completed])
  end

  def generate
    if request.get?
      @default_start = 1.month.since.beginning_of_month
      @default_end = 1.month.since.end_of_month
    else
      generation_result = 
        case params.require(:type)
        when 'ntd'
          Survey.generate_ntd(
            start_date: params.require(:start_date),
            end_date: params.require(:end_date),
            daily_count: params.require(:daily_count)
          )
        when 'in_house' #TODO
        end
      #TODO: handle failure
      flash[:notice] = 'Successfully generated surveys.'
      redirect_to surveys_path
    end
  end

  def index
    params[:page] = 1 if params[:page] == ''
    @completed = params[:completed] == 'true'
    @surveys = Survey.where(completed: @completed)
                     .paginate(page: params[:page], per_page: 25)
    cookies[:page] = params[:page]
    cookies[:completed] = @completed
  end

  def pdf
    surveys = Survey.find(params[:surveys]).sort_by(&:date)
    surveys.each { |survey| survey.update printed: true }
    pdf = SurveyPdf.new(surveys)
    send_data pdf.render, filename: "Survey #{DateTime.current}.pdf",
                          type: 'application/pdf', disposition: 'inline'
  end

  def update
    if @survey.update survey_params
      flash[:notice] = 'Successfully updated survey.'
    else
      flash[:alert] = @survey.errors.full_messages
    end
    redirect_to surveys_path(page: cookies[:page],
                             completed: cookies[:completed])
  end

  private

  def find_survey
    @survey = Survey.find_by id: params.require(:id)
    # render public/404 unless @survey.present?
  end

  def survey_params
    params.require(:survey).permit(:starting_pax, :completed,
                                   survey_trip_stops_attributes: [:id, :boarded,
                                                                  :alighted])
  end
end
