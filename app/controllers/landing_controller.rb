class LandingController < ApplicationController
  include WundergroundHelper

  def index
    @lacrosse_dump = LacrosseDump.order(:created_at).last
  end
end