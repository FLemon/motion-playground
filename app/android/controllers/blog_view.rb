class BlogView < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Blog_activity)

    initialize

    assign_outlets
    @requestQueue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
    @requestQueue.add(sync_data) if BlogsCollection.empty?
  end

  def assign_outlets
    blogsTable.parent = self
    blogsTable.outlet = findViewById(R::Id::Blogs_table)
  end

  def sync_data
    BlogsCollection.fetch do |blogs|
      blogsTable.reload_with_data(blogs)
    end
  end
end
