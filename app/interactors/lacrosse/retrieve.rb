class Lacrosse::Retrieve
  include Interactor::Organizer

  organize(
    Lacrosse::Login,
    Lacrosse::Locations,
    Lacrosse::Devices
  )
end