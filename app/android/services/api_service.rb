class ApiService
  API_HOST = "https://jinthepimp.herokuapp.com"
  TWITS_URL = API_HOST + '/api/twits'

  def self.get_twits(&block)
    Com::Android::Volley::Toolbox::JsonObjectRequest.new(
      0,
      TWITS_URL,
      nil,
      RequestListener.new(block),
      nil
    )
  end
end
