class Twit < TwitView
  attr_accessor :twitsCollection, :twitsTable

  def initialize
    @apiService = ApiService.new
    @twitsCollection = TwitsCollection.new
    @twitsTable = TwitsTable.new(@twitsCollection.twits)
  end
end
