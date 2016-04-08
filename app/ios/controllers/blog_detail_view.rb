class BlogDetailView < UIViewController
  extend IB

  outlet :blogBodyTextViewOutlet, UITextView

  def viewDidLoad
    initialize
  end

  def viewDidAppear(animated)
    assign_outlets
  end

  private

  def assign_outlets
    blog_body_text_view.outlet = blogBodyTextViewOutlet
  end
end
