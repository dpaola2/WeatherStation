class Lacrosse::Login
  include Interactor

  def call
    context.login_response = HTTParty.post(
      url,
      body: {
        email: email,
        returnSecureToken: true,
        password: password
      }
    )

    context.token = context.login_response.parsed_response["idToken"]
  end

  def url
    "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyD-Uo0hkRIeDYJhyyIg-TvAv8HhExARIO4"
  end

  def email
    ENV['LACROSSE_EMAIL']
  end

  def password
    ENV['LACROSSE_PASSWORD']
  end
end