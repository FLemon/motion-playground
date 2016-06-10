class Twit < TwitView
  attr_accessor :twitsTable

  def initialize
    @apiService = ApiService.new
    @twitsTable = TwitsTable.new(TwitsCollection.twits)
  end
end
