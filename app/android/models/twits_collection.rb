class TwitsCollection
  TWITS_PLACEHOLDER = ['Fetching...Be patient']
  @@twits ||= TWITS_PLACEHOLDER

  def self.count
    @@twits.count
  end

  def self.twits
    @@twits ||= TWITS_PLACEHOLDER
  end

  def self.empty?
    @@twits == TWITS_PLACEHOLDER
  end

  def self.assign_json_array(json)
    json_array = json.getJSONArray('twitsCollection')

    @@twits = (0..json_array.length-1).map do |index|
      twit = json_array.getString(index)
    end
  end

  def self.fetch(&block)
    if empty?
      ApiService.get_twits do |twits|
        block.call(assign_json_array(twits))
      end
    else
      block.call(@@twits)
    end
  end
end
