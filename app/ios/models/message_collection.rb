class MessageCollection
  def initialize(collection=nil)
    @messages = collection || ['Fetching...Be patient']
    self.sync
  end

  def sample
    @messages.sample
  end

  def sync
    AFMotion::JSON.get("https://jinthepimp.herokuapp.com/api/twits") do |response|
      if response.success?
        @messages = response.object["twitsCollection"]
      end
    end
  end
end
