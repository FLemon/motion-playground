class TwitsTable
  UP_RATE = 'Like it'
  DOWN_RATE = 'Hmmm...'

  def initialize(tableData)
    @table_data = tableData
    @table_data = ['Fetching...Be patient'] if @table_data.empty?
  end

  def outlet=(table_outlet)
    @outlet = WeakRef.new(table_outlet)
    @outlet.dataSource = self
    @outlet.delegate = self
    @outlet.reloadData
  end

  def reload_with_data(value)
    @table_data = value
    @outlet.reloadData
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    reuseIdentifier ||= 'CELL_IDENTIFIER'

    cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: reuseIdentifier)

    cell.textLabel.text = @table_data[indexPath.row]

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @table_data.count
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = BasicPopup.new({
      delegate: self,
      message: @table_data[indexPath.row],
      buttons: [UP_RATE, DOWN_RATE]
    })
    alert.show
  end

  def alertView(alertView, clickedButtonAtIndex: indexPath)
    case alertView.buttonTitleAtIndex(indexPath)
    when UP_RATE

    when DOWN_RATE
    else
      alert = twitsPopup.new({
        twits:  "unhandled button click: #{alertView.buttonTitleAtIndex(indexPath)}",
        buttons: ["OK"]
      })
      alert.show
    end
  end
end
