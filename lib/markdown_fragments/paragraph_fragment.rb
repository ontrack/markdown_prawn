class ParagraphFragment < MarkdownFragment
  def render_on(pdf_object, options = {})
    arguments = _default_render_options.merge(options)

    pdf_object.pad(pdf_object.height_of(" ")/2) do
      pdf_object.formatted_text formatted_content, arguments
    end
  end

  private

  def _default_render_options
    options = { :size => 10, :align => :left, :leading => 0 }
    options = options.merge({:inline_format => true})
    options
  end

end
