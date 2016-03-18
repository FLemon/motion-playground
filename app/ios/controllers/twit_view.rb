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
    messageTable.outlet = self.tableView
  end

  def sync_data
    messageCollection.fetch do |messages|
      messageTable.reload_with_data(messages)
      self.refreshControl.endRefreshing
    end
  end
end
