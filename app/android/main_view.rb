class MainView < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Main_activity)

    initialize

    assign_outlets

    url = "https://jinthepimp.herokuapp.com/api/twits"
    request = Com::Android::Volley::Toolbox::JsonObjectRequest.new(0, url, nil, RequestListener.new(messageCollection), nil)
    @requestQueue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
    @requestQueue.add(request)
  end

  def onClick(view)
    pimpButton.on_tap
  end

  def assign_outlets
    messageLabel.outlet = findViewById(R::Id::Message_label)
    pimpButton.outlet = findViewById(R::Id::Pimp_it)
    pimpButton.onClickListener = self
  end
end
