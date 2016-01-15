class Label
  def initialize(text)
    @text = text
  end

  def outlet=(label_outlet)
    @outlet = label_outlet
    self.text = @text
  end

  def text=(value)
    @outlet.text = value
    @text = value
  end
end
