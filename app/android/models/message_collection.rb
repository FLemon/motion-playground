class MessageCollection
  def initialize(url='')
    @url = url
    @messages ||= ['Fetching...Be patient']
  end

  def sample
    @messages.get(Random.new.nextInt(@messages.length))
  end

  def setMessage(msg)
    @messages = msg.getJSONArray('twitsCollection')
  end

  def sync
    Com::Android::Volley::Toolbox::JsonObjectRequest.new(0, @url, nil, RequestListener.new(self), nil)
  end
end
