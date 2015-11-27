class MainActivity < Android::App::Activity
  attr_accessor :pimpButton
  attr_accessor :messageLabel

  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Main_activity)

    @pimpButton = findViewById(R::Id::Pimp_it)
    @messageLabel = findViewById(R::Id::Message_label)
    @pimpButton.onClickListener = self

    url = "https://jinthepimp.herokuapp.com/api/twits"
    request = Com::Android::Volley::Toolbox::JsonObjectRequest.new(0, url, nil, RequestListener.new(self), nil)
    @requestQueue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
    @requestQueue.add(request)
  end

  def onClick(view)
    message = @messages ? @messages.get(Random.new.nextInt(@messages.length)) : "Fetching...Be patient"
    @messageLabel.text = message
  end

  def setMessage(msg)
    @messages = msg.getJSONArray('twitsCollection')
  end
end

class RequestListener
  attr_accessor :activity

  def initialize(activity)
    @activity = activity
  end

  def onResponse(json)
    @activity.setMessage(json)
  end
end
