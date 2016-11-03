class SurveyPdf < Prawn::Document
  def sts_table(survey)
    sts = survey.survey_trip_stops.order(:sequence_number)
    sts_table = [['Time', 'Location', 'Passengers boarded',
                  'Passengers alighted']]
    sts_data = sts.map do |s|
      [s.time.strftime('%H:%M'), s.location,
       survey.completed ? s.boarded : '',
       survey.completed ? s.alighted : '']
    end
    sts_table + sts_data
  end

  def survey_table(survey)
    [['Survey #', 'Date', 'Shift', 'Time'],
     [survey.id, survey.formatted_date, survey.shift,
      survey.time]]
  end

  def sentence_location(survey)
    if survey.completed
      text " #{survey.starting_pax}
      #{'passenger'.pluralize(survey.starting_pax)} on bus
      when departing #{survey.location}".squish
    else
      text "Number of passengers on bus when departing
        #{survey.location}: ____________".squish
    end
  end

  def disclaimer(survey)
    text "If this survey runs past your shift, please instruct the
          next driver to finish the survey.".squish,
         style: :bold unless survey.completed
  end

  def initialize(surveys)
    super(top_margin: 25, page_size: 'LETTER', page_layout: :landscape)
    font_size 8
    surveys.each do |survey|
      column_box([0, cursor], columns: 2, width: bounds.width) do
        table(survey_table(survey))
        move_down 20
        sentence_location(survey)
        move_down 10
        table(sts_table(survey), row_colors: %w(ffffff cccccc))
        move_down 10
        disclaimer(survey)
      end
      start_new_page unless survey == surveys.last
    end
  end
end
