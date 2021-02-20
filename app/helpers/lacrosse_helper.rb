module LacrosseHelper
  def device_map(location, device)
    sensor = device["sensor"]

    {
      device_name: device["name"].downcase.sub(" ", "_"),
      device_id: device["id"],
      sensor_type_name: sensor["type"]["name"],
      sensor_id: sensor["id"],
      sensor_field_names: sensor["fields"].keys.map(&:downcase).reject {|f| f == "notsupported"}.join(",")
    }
  end
end