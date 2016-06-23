class BlogBodyTextView
	def initialize(text)
		@text = text
	end

	def outlet=(text_view_outlet)
		@outlet = text_view_outlet
    @outlet.setMovementMethod(Android::Text::Method::ScrollingMovementMethod.new)
	end

	def text=(text)
    markdown_parser = Org::Commonmark::Parser::Parser.builder.build
    doc = markdown_parser.parse(text)
    renderer = Org::Commonmark::Html::HtmlRenderer.builder.build
    parsed_text = renderer.render(doc)
    @outlet.text = Android::Text::Html.fromHtml(parsed_text)
	end
end
