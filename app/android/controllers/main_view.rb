class MainView < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Main_activity)

    initialize

    assign_outlets
    menuTable.parent = self
    menuTable.set_adapter

    # @requestQueue ||= Com::Android::Volley::Toolbox::Volley.newRequestQueue(self)
    # @requestQueue.add(messageCollection.sync)
  end

  private

  def assign_outlets
    menuTable.outlet = findViewById(R::Id::Menu_table)
  end
end
