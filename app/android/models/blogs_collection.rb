class BlogsCollection
  @@blogs ||= []

  def self.count
    @@blogs.count
  end

  def self.blogs
    @@blogs
  end

  def self.empty?
    @@blogs.empty?
  end

  def self.assign_json_array(json)
    @@blogs = json.getJSONArray('blogsCollection')

    # @@blogs = (0..json_array.length-1).map do |index|
    #   json_array.getString(index)
    # end
  end

  def self.fetch(&block)
    ApiService.get_blogs do |blogs|
      block.call(assign_json_array(blogs))
    end
  end
end
