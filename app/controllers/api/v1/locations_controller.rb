class Api::V1::LocationsController < Api::V1::V1Controller
  load_and_authorize_resource

  def index
    respond_with @locations
  end

  def show
    @reservations = Reservation.where location_id: @location.id
    respond_with @location
  end

  def create
    @location = Location.create params
    respond_with @location
  end

  def update
    @location.update_attributes params
    respond_with @location
  end
end
