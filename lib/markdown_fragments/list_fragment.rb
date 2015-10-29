class ListFragment < MarkdownFragment
  attr_accessor :ordered
  def render_on(pdf, options = {})
    bullet = '• '
    arguments = options
    width = ((pdf.bounds.width / 100) * 90)
    data = []

    @content.each_with_index do |item, i|
      item = item.gsub(/\s\s+/,' ')
      if ordered?
        bullet = "#{i+1}."
      end
      data << [bullet,item]
    end
    data.each do |row|
      pdf.move_down 5
      pdf.draw_text "#{row[0]}#{row[1]}", at: [10, pdf.cursor]
    end
  end

  def ordered?
    @ordered == true
  end
end
