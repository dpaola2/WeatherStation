class Wunderground::Upload
  include Interactor::Organizer

  organize(
    Wunderground::Clean,
    Wunderground::Queue
  )
end