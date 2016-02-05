class Main < MainView
  attr_accessor :messageCollection, :messageTable

  def initialize
    @messageCollection = MessageCollection.new("https://jinthepimp.herokuapp.com/api/twits")
    @messageTable = MessageTable.new(@messageCollection.messages)
  end
end
