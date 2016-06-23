class Blog < BlogView
  attr_accessor :blogsTable

  def initialize
    @apiService = ApiService.new
    @blogsTable = BlogsTable.new(BlogsCollection.blogs)
  end
end
