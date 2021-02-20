module LacrosseHelper
  def lacrosse_token
    url = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyD-Uo0hkRIeDYJhyyIg-TvAv8HhExARIO4"
    payload = {
      email: ENV['LACROSSE_EMAIL'],
      returnSecureToken: true,
      password: ENV['LACROSSE_PASSWORD']
    }

    response = HTTParty.post(url, body: payload)
    response.parsed_response["idToken"]
  end
end