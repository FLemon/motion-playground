class ApiService
  API_HOST = "https://jinthepimp.herokuapp.com"
  GET_MESSAGE_URL = API_HOST + '/api/twits'

  def self.get_messages(&block)
    AFMotion::JSON.get(GET_MESSAGE_URL) do |response|
      if response.success?
        block.call(response.object["twitsCollection"]) if block
      end
    end
  end

  def self.rate_message(message)
  end
end
