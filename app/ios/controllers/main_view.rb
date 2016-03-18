class MainView < UIViewController
  extend IB

  outlet :menuTableOutlet, UITableView

  def viewDidLoad
    initialize
  end

  def viewDidAppear(animated)
    assign_outlets
    menuTable.view = self
  end

  private

  def assign_outlets
    menuTable.outlet = menuTableOutlet
  end
end
