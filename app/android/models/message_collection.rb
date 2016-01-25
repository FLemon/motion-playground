class MessageCollection
  def initialize(collection=nil)
    @messages = collection || ['Fetching...Be patient']
    self.sync
  end

  def sample
    @messages.get(Random.new.nextInt(@messages.length))
  end

  def sync
    url = "https://jinthepimp.herokuapp.com/api/twits"
  end

  def setMessage(msg)
    @messages = msg.getJSONArray('twitsCollection')
  end
end
