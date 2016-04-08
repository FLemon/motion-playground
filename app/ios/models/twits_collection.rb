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

  def fetch(&block)
    ApiService.get_twits do |twits|
      @twits = twits
      block.call(@twits)
    end
  end
end
