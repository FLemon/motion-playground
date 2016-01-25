class MainView < UIViewController
  extend IB

  outlet :messageLabelOutLet, UILabel
  outlet :pimpButtonOutlet, UIButton

  def PimpIt(sender)
    pimpButton.on_tap
  end

  def viewDidAppear(animated)
    initialize

    assign_outlets_to_IB
  end

  private

  def assign_outlets_to_IB
    messageLabel.outlet = messageLabelOutLet
    pimpButton.outlet = pimpButtonOutlet
  end
end
