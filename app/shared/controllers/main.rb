class Main < MainView
  attr_accessor :messageCollection, :messageLabel, :pimpButton

  def initialize
    @messageCollection = MessageCollection.new("https://jinthepimp.herokuapp.com/api/twits")
    @messageLabel = Label.new('*Pimp it, Jin has something to say')
    @pimpButton = Button.new('*Pimp it') { self.get_message_sample }
  end

  def get_message_sample
    messageLabel.text = messageCollection.sample
  end
end
