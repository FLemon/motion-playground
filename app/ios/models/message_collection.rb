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

  def fetch(&block)
    ApiService.get_messages do |messages|
      @messages = messages
      block.call(@messages)
    end
  end
end
