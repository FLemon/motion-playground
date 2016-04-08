class BlogsCollection
  def initialize
    @blogs ||= ['Fetching...Be patient']
  end

  def count
    @blogs.count
  end

  def blogs
    @blogs
  end

  def fetch(&block)
    ApiService.get_blogs do |blogs|
      @blogs = blogs
      block.call(@blogs)
    end
  end
end
