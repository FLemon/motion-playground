class TwitsCollection
  @@twits ||= []
  def self.count
    @@twits.count
  end

  def self.twits
    @@twits
  end

  def self.fetch(&block)
    ApiService.get_twits do |twits|
      @@twits = twits
      block.call(@@twits)
    end
  end
end
