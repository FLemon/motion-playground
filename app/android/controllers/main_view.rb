class MainView < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Main_activity)

    initialize

    assign_outlets
  end

  private

  def assign_outlets
    menuTable.parent = self
    menuTable.outlet = findViewById(R::Id::Menu_table)
  end
end
