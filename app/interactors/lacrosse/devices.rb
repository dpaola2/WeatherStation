class Lacrosse::Devices
  include Interactor

  delegate :locations, :token, to: :context

  def call
    context.devices = locations.map {|loc| devices_for_location(loc) }.flatten
  end

  private

  def devices_for_location(location)
    url = url_for_location(location["id"])
    response = HTTParty.get(
      url,
      headers: {
        "Authorization" => "Bearer #{token}"
      }
    )
    response.parsed_response["items"]
  end

  def url_for_location(location_id)
    "https://lax-gateway.appspot.com/_ah/api/lacrosseClient/v1.1/active-user/location/#{location_id}/sensorAssociations?prettyPrint=false"
  end
end