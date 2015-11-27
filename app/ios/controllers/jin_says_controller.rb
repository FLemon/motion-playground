class JinSaysController < UIViewController
  extend IB

  outlet :messageLabel, UILabel
  outlet :pimpButton, UIButton

  def PimpIt(sender)
    messageLabel.text = @messages.sample
  end

  def viewDidAppear(animated)
    @messages = ['Fetching...Be patient']
    AFMotion::JSON.get("https://jinthepimp.herokuapp.com/api/twits") do |response|
      if response.success?
        @messages = response.object["twitsCollection"]
      end
    end
  end
end
