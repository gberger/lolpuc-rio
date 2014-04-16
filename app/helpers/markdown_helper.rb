module MarkdownHelper
  def markdown(text)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      footnotes: true,
      supercript: true
    }
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(link_attributes: {"target" => "_blank"}), options)
    html = renderer.render text

    doc = Nokogiri::HTML(html)
    doc.css('table').add_class('table table-striped table-bordered table-hover')

    doc.css('body').to_s.html_safe
  end
end
