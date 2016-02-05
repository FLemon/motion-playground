class MessageTable
  UP_RATE = 'Like it'
  DOWN_RATE = 'Hmmm...'

  def initialize(tableData)
    @table_data = tableData
  end

  def outlet=(label_outlet)
    @outlet = label_outlet
    @outlet.dataSource = self
    @outlet.delegate = self
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

    alert = MessagePopup.new({
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
      alert = MessagePopup.new({
        message:  "unhandled button click: #{alertView.buttonTitleAtIndex(indexPath)}",
        buttons: ["OK"]
      })
      alert.show
    end
  end
end
