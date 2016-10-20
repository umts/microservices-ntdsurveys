class SurveyPdf < Prawn::Document
  def initialize(surveys)
    super(top_margin: 25, page_size: 'LETTER', page_layout: :landscape)
    font_size 8
    surveys.each do |survey|
      column_box([0, cursor], columns: 2, width: bounds.width) do
        table([['Survey #', 'Date', 'Shift', 'Time'],
               [survey.id,
                survey.date.strftime('%m/%d/%Y'),
                survey.shift,
                survey.date.strftime('%H:%M')]])
        move_down 20
        if survey.completed
          text survey.starting_pax.to_s +
               " #{'passenger'.pluralize(survey.starting_pax)} on bus when departing " +
               survey.survey_trip_stops.first.location
        else
          text 'Number of passengers on bus when departing ' +
               survey.survey_trip_stops.first.location + ':   ____________'
        end
        move_down 10
        table_data = [['Time', 'Location', 'Passengers boarded', 'Passengers alighted']]
        survey.survey_trip_stops.order(:sequence_number).each do |sts|
          table_data.push([sts.time.strftime('%H:%M'),
                           sts.location,
                           survey.completed ? sts.boarded : '',
                           survey.completed ? sts.alighted : ''])
        end
        table(table_data, row_colors: %w(ffffff cccccc))
        move_down 10
        text 'If this survey runs past your shift, please instruct the next driver to finish the survey.',
             style: :bold unless survey.completed
      end
      start_new_page unless survey == surveys.last
    end
  end
end
