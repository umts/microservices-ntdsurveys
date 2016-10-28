class SurveyPdf < Prawn::Document
  def initialize(surveys)
    super(top_margin: 25, page_size: 'LETTER', page_layout: :landscape)
    font_size 8
    surveys.each do |survey|
      column_box([0, cursor], columns: 2, width: bounds.width) do
        table([['Survey #', 'Date', 'Shift', 'Time'],
               [survey.id, survey.formatted_date, survey.shift,
                survey.time]])
        move_down 20
        text survey.sentence_location
        move_down 10
        table(survey.sts_table, row_colors: %w(ffffff cccccc))
        move_down 10
        text "If this survey runs past your shift, please instruct the \
              next driver to finish the survey.".squish,
             style: :bold unless survey.completed
      end
      start_new_page unless survey == surveys.last
    end
  end
end
