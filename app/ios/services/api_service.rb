class ApiService
  API_HOST = "https://pin-sensation.herokuapp.com"
  TWITS_URL = API_HOST + '/api/twits'
  BLOGS_URL = API_HOST + '/api/git/issues'

  def self.get_twits(&block)
    AFMotion::JSON.get(TWITS_URL) do |response|
      if response.success?
        block.call(response.object["twitsCollection"]) if block
      end
    end
  end

  def self.get_blogs(&block)
    AFMotion::JSON.get(BLOGS_URL) do |response|
      if response.success?
        block.call(response.object["blogsCollection"]) if block
      end
    end
  end
end
