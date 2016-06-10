class TwitView < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Twit_activity)

    initialize

    assign_outlets
    @requestQueue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
    @requestQueue.add(sync_data)
  end

  def assign_outlets
    twitsTable.parent = self
    twitsTable.outlet = findViewById(R::Id::Twits_table)
  end

  def sync_data
    # twitsCollection.fetch(twitsTable)
    TwitsCollection.fetch do |twits|
      p 'got the twits'
      twitsTable.reload_with_data(twits)
    end
  end
end
