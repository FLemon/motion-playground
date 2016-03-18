class MenuTable
  def initialize(tableData)
    @table_data = tableData
  end

  def outlet=(label_outlet)
    @outlet = WeakRef.new(label_outlet)
    @outlet.dataSource = self
    @outlet.delegate = self
    @outlet.reloadData
  end

  def view=(view)
    @view = WeakRef.new(view)
  end

  def reload_with_data(value)
    @table_data = value
    @outlet.reloadData
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    reuseIdentifier ||= 'menu_cell'

    cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: reuseIdentifier)

    cell.textLabel.text = @table_data[indexPath.row]

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @table_data.count
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    if @table_data[indexPath.row] == 'Twits'
      @view.performSegueWithIdentifier('twitSegue', sender: self)
    else
      @view.performSegueWithIdentifier('blogSegue', sender: self)
    end
  end
end
