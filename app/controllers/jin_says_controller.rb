class JinSaysController < UIViewController
  extend IB

  outlet :messageLabel, UILabel
  outlet :pimpButton, UIButton

  def PimpIt(sender)
    messageLabel.text = @messages.sample
  end

  def viewDidAppear(animated)
    AFMotion::JSON.get("https://jinthepimp.herokuapp.com/api/twits") do |response|
      if response.success?
        @messages = response.object["twitsCollection"]
      else
        @messages = ['Request failed, ckeck your internet connectivity']
      end
    end
  end
end
