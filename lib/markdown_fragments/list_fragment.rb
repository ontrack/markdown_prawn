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
      pdf.indent(10) do
        pdf.text "#{row[0]}#{row[1]}"
      end
    end
  end

  def ordered?
    @ordered == true
  end
end
