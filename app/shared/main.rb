class Main < MainView
  attr_accessor :messageCollection, :messageLabel, :pimpButton

  def initialize
    @messageCollection = MessageCollection.new
    @messageLabel = Label.new('*Pimp it, Jin has something to say')
    @pimpButton = Button.new('*Pimp it') { get_message_sample }
  end

  def get_message_sample
    messageCollection.sample
  end
end
