class BlogDetailView < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Blog_detail_activity)

    initialize

    assign_outlets
  end

  def assign_outlets
    blog_detail = getIntent.getExtras.getString('blog_detail')
    body = Org::Json::JSONObject.new(blog_detail).get("body")
    blog_body_text_view.outlet = findViewById(R::Id::Blog_detail)
    blog_body_text_view.text = body
  end
end
