class MessageCollection
  def initialize(url='')
    @url = url
    @messages ||= ['Fetching...Be patient']
  end

  def sample
    @messages.sample
  end

  def sync
    AFMotion::JSON.get(@url) do |response|
      if response.success?
        @messages = response.object["twitsCollection"]
      end
    end
  end
end
