class BlogView < UITableViewController
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
    blogsTable.parent = self
  end

  def prepareForSegue(segue, sender: sender)
    if segue.identifier == 'blogDetailsSegue'
      blog_ctrl = segue.destinationViewController
      blog_ctrl.blog_data = sender
    end
  end

  private

  def assign_outlets
    blogsTable.outlet = self.tableView
  end

  def sync_data
    BlogsCollection.fetch do |blogs|
      blogsTable.reload_with_data(blogs)
      self.refreshControl.endRefreshing
    end
  end
end
