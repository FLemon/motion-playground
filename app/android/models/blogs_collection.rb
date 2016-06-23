class BlogsCollection
  @@blogs ||= []

  def self.count
    @@blogs.count
  end

  def self.blogs
    @@blogs
  end

  def self.empty?
    @@blogs.length == 0
  end

  def self.assign_json_array(json)
    @@blogs = json.getJSONArray('blogsCollection')
  end

  def self.fetch(&block)
    ApiService.get_blogs do |blogs|
      block.call(assign_json_array(blogs))
    end
  end
end
