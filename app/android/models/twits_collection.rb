class TwitsCollection
  @@twits ||= []

  def self.count
    @@twits.count
  end

  def self.twits
    @@twits
  end

  def self.empty?
    @@twits.empty?
  end

  def self.assign_json_array(json)
    json_array = json.getJSONArray('twitsCollection')

    @@twits = (0..json_array.length-1).map do |index|
      json_array.getString(index)
    end
  end

  def self.fetch(&block)
    ApiService.get_twits do |twits|
      block.call(assign_json_array(twits))
    end
  end
end
