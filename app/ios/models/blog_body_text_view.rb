class BlogBodyTextView
  def initialize(text)
    text = text.fetch('body')
    html_text = MMMarkdown.HTMLStringWithMarkdown(text, extensions: MMMarkdownExtensionsGitHubFlavored, error: nil)
    html_text = html_text.stringByAppendingString("<style>body{font-family: HelveticaNeue-Light; font-size:14pt;}</style>")
    parsed_text = NSMutableAttributedString.new.initWithData(
      html_text.dataUsingEncoding(NSUTF8StringEncoding),
      options: {
        NSDocumentTypeDocumentAttribute => NSHTMLTextDocumentType,
        NSCharacterEncodingDocumentAttribute => NSUTF8StringEncoding
      },
      documentAttributes: nil,
      error: nil)
    @text = parsed_text
  end

  def outlet=(text_view_outlet)
    @outlet = WeakRef.new(text_view_outlet)
    @outlet.attributedText = @text
  end
end
