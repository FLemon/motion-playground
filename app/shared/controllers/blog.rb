class Blog < BlogView
  attr_accessor :blogsCollection, :blogsTable

  def initialize
    @apiService = ApiService.new
    @blogsCollection = BlogsCollection.new
    @blogsTable = BlogsTable.new(@blogsCollection.blogs)
  end
end
