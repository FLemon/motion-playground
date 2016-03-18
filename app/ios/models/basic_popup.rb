class BasicPopup
  def initialize(options={})
    @outlet = UIAlertView.alloc.init
    self.delegate = options[:delegate] if options[:delegate]
    self.message = options[:message]
    self.buttons = options[:buttons]
  end

  def delegate=(value)
    @outlet.delegate = value
  end

  def message=(value)
    @outlet.message = value
  end

  def buttons=(value)
    value.each { |title| @outlet.addButtonWithTitle(title) }
  end

  def show
    @outlet.show
  end
end
