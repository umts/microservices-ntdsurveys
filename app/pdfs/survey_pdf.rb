class SurveyPdf < Prawn::Document
  def initialize(surveys)
    super(top_margin: 25, page_size: 'LETTER', page_layout: :landscape)
    font_size 8
    surveys.each do |survey|
      start_new_page unless survey == surveys.last
    end
  end
end