class ApiService
  API_HOST = "https://jinthepimp.herokuapp.com"
  TWITS_URL = API_HOST + '/api/twits'

  def self.get_twits(&block)
    AFMotion::JSON.get(TWITS_URL) do |response|
      if response.success?
        block.call(response.object["twitsCollection"]) if block
      end
    end
  end

  def self.rate_message(message)
  end
end
