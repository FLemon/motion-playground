class MainView < UIViewController
  extend IB

  outlet :messageLabelOutLet, UILabel
  outlet :pimpButtonOutlet, UIButton

  def viewDidAppear(animated)
    initialize

    assign_outlets

    messageCollection.sync
  end

  def PimpIt(sender)
    pimpButton.on_tap
  end

  private

  def assign_outlets
    messageLabel.outlet = messageLabelOutLet
    pimpButton.outlet = pimpButtonOutlet
  end
end
