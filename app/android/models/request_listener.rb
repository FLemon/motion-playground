class RequestListener
  attr_accessor :obj

  def initialize(obj)
    @obj = obj
  end

  def onResponse(json)
    @obj.setMessage(json)
  end
end
