class Lacrosse::Locations
  include Interactor

  delegate :token, to: :context

  def call
    url = "https://lax-gateway.appspot.com/_ah/api/lacrosseClient/v1.1/active-user/locations"
    context.locations_response = HTTParty.get(
      url,
      headers: {
        "Authorization" => "Bearer #{token}"
      }
    )
    context.locations = context.locations_response.parsed_response["items"]
  end
end