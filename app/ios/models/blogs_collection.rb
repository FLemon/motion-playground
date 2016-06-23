class BlogsCollection
  @@blogs ||= []

  def self.count
    @@blogs.count
  end

  def self.blogs
    @@blogs
  end

  def self.fetch(&block)
    ApiService.get_blogs do |blogs|
      @@blogs = blogs
      block.call(@@blogs)
    end
  end
end
