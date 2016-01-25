class Button
  def initialize(text, &block)
    @text = text
    @on_tap_action = block if block
  end

  def outlet=(button_outlet)
    @outlet = button_outlet
    self.text = @text
  end

  def text=(value)
    @outlet.text = value
    @text = value
  end

  def on_tap
    raise "on tap action not defined" unless @on_tap_action
    @on_tap_action.call
  end

  def onClickListener=(obj)
    @outlet.onClickListener = obj
  end
end
