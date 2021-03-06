class TwitView < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Twit_activity)

    initialize

    assign_outlets
    @requestQueue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
    @requestQueue.add(sync_data) if TwitsCollection.empty?
  end

  def assign_outlets
    twitsTable.parent = self
    twitsTable.outlet = findViewById(R::Id::Twits_table)
  end

  def sync_data
    TwitsCollection.fetch do |twits|
      twitsTable.reload_with_data(twits)
    end
  end
end
