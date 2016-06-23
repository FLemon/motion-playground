class RequestListener
  attr_accessor :obj

  def initialize(obj)
    @obj = obj
  end

  def onResponse(json)
    p 'json data downloaded'
    obj.call(json)
  end
end
