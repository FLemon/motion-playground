class MainView < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Main_activity)

    initialize

    assign_outlets

    @requestQueue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
    @requestQueue.add(messageCollection.sync)
  end

  def onClick(view)
    pimpButton.on_tap
  end

  private

  def assign_outlets
    messageLabel.outlet = findViewById(R::Id::Message_label)
    pimpButton.outlet = findViewById(R::Id::Pimp_it)
    pimpButton.onClickListener = self
  end
end
