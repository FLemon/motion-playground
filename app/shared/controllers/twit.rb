class Twit < TwitView
  attr_accessor :messageCollection, :messageTable

  def initialize
    @apiService = ApiService.new
    @messageCollection = MessageCollection.new("https://jinthepimp.herokuapp.com/api/twits")
    @messageTable = MessageTable.new(@messageCollection.messages)
  end
end
