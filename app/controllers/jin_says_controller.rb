class JinSaysController < UIViewController
  extend IB

  outlet :messageLabel, UILabel
  outlet :pimpButton, UIButton

  def PimpIt(sender)
    messageLabel.text = "pimped"
  end

  def viewDidLoad
    super
    NSLog("main: %@", messageLabel.text)
  end

end
