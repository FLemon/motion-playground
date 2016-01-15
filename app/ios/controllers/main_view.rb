class MainView < UIViewController
  extend IB

  outlet :messageLabelOutLet, UILabel
  outlet :pimpButtonOutlet, UIButton

  def PimpIt(sender)
    # pimpButton.on_tap
    messageLabel.text = 'hello'
  end

  def viewDidAppear(animated)
    initialize
    assign_outlets_to_IB
    AFMotion::JSON.get("https://jinthepimp.herokuapp.com/api/twits") do |response|
      if response.success?
        @messageCollection = response.object["twitsCollection"]
      end
    end
  end

  private

  def assign_outlets_to_IB
    messageLabel.outlet = messageLabelOutLet
    pimpButton.outlet = pimpButtonOutlet
  end
end
