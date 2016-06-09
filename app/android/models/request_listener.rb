class RequestListener
  attr_accessor :obj

  def initialize(obj)
    @obj = obj
  end

  def onResponse(json)
    p 'listener'
    obj.reload_with_data(json.getJSONArray('twitsCollection'))
  end
end
