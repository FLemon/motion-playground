class TwitsCollection
  def initialize
    @twits ||= ['Fetching...Be patient']
  end

  def count
    @twits.count
  end

  def twits
    @twits
  end

  def fetch(table)
    ApiService.get_twits(table)
    # do |twits|
    #   @twits = twits
    #   block.call(@twits)
    # end
  end
end
