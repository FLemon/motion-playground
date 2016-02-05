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
    ApiService.get_messages do |messages|
      @messages = messages
      table.reload_with_data(@messages)
    end
  end
end
