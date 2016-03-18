class TwitView < UITableViewController
  def viewDidLoad
    initialize

    self.refreshControl = UIRefreshControl.new
    self.refreshControl.addTarget(self,
                                  action:'sync_data',
                                  forControlEvents:UIControlEventValueChanged)
  end

  def viewDidAppear(animated)
    assign_outlets
    sync_data
  end

  private

  def assign_outlets
    twitsTable.outlet = self.tableView
  end

  def sync_data
    twitsCollection.fetch do |twits|
      twitsTable.reload_with_data(twits)
      self.refreshControl.endRefreshing
    end
  end
end
