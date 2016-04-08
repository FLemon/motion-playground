class BlogsTable
  def initialize(tableData)
    @table_data = tableData
  end

  def outlet=(table_outlet)
    @outlet = WeakRef.new(table_outlet)
    @outlet.dataSource = self
    @outlet.delegate = self
    @outlet.reloadData
  end

  def parent=(view)
    @parent = WeakRef.new(view)
  end

  def reload_with_data(value)
    @table_data = value
    @outlet.reloadData
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    reuseIdentifier ||= 'CELL_IDENTIFIER'

    cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: reuseIdentifier)

    cell_data = @table_data[indexPath.row]
    cell.textLabel.text = if cell_data.respond_to?(:fetch)
                            @table_data[indexPath.row].fetch('title')
                          else
                            @table_data[indexPath.row]
                          end

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @table_data.count
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    @selected_blog = @table_data[indexPath.row]
    if @selected_blog.respond_to?(:fetch)
      @parent.performSegueWithIdentifier('blogDetailsSegue', sender: @selected_blog)
    end
  end
end
