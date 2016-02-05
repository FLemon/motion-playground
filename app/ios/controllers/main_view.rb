class MainView < UIViewController
  extend IB

  outlet :messageTableOutlet, UITableView

  def viewDidLoad
    initialize
  end

  def viewDidAppear(animated)
    assign_outlets
    messageCollection.sync_and_update(messageTable)
  end

  private

  def assign_outlets
    messageTable.outlet = messageTableOutlet
  end
end
