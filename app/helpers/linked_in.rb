module LinkedIn
  extend self
  attr_accessor :key, :secret, :redirect_uri, :response_type
  
  def setup params
    self.key = params[:key]
    self.secret = params[:secret]
    self.redirect_uri = params[:redirect_uri]
    self.response_type = params[:response_type] || 'code'
  end

  def authorization_url
    "#{base_url}#{auth_request_params}"
  end

  def get_access_token authorization_code
    params = uri_encode access_token_params(authorization_code)
    response = HTTParty.get "#{base_url}accessToken?#{params}"
    response.parsed_response["access_token"]
  end

  private
  
  def base_url
    "https://www.linkedin.com/uas/oauth2/"
  end

  def access_token_params authorization_code
    {
      "grant_type" => "authorization_code",
      "code" => authorization_code,
      "redirect_uri" => self.redirect_uri,
      "client_id" => self.key,
      "client_secret" => self.secret

    }
  end

  def auth_request_params
    "authorization?#{uri_encode(authorization_params)}"
  end

  def authorization_params
    {
      "response_type" => self.response_type,
      "client_id" => self.key,
      "state" => state,
      "redirect_uri" => self.redirect_uri
    }
  end

  def state
    SecureRandom.base64
  end

  def uri_encode params
    params.reduce("") do |uri, (k, v)|
      uri << "&#{k}=#{v}"
      uri
    end
  end
end
