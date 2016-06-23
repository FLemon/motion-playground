class BlogDetail < BlogDetailView
  attr_accessor :blog_data, :blog_body_text_view

  def initialize
    @blog_body_text_view = BlogBodyTextView.new(blog_data)
  end

  def blog_data=(data)
    @blog_data = data
  end
end
