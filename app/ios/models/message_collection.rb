class MessageCollection
  def initialize(url='')
    @url = url
    @messages ||= ['Fetching...Be patient']
  end

  def sample
    @messages.sample
  end

  def count
    @messages.count
  end

  def messages
    @messages
  end

  def sync_and_update(table)
    AFMotion::JSON.get(@url) do |response|
      if response.success?
        @messages = response.object["twitsCollection"]
        table.reload_with_data(@messages)
      end
    end
  end
end
