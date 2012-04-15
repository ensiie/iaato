class Api::V1::ReservationsController < Api::V1::V1Controller
  load_and_authorize_resource

  def index
    if params[:ship_id] == nil then
      @reservations = Reservation.where location_id: BSON::ObjectId(params[:location_id])
    elsif params[:location_id] == nil
      @reservations = Reservation.where ship_id: BSON::ObjectId(params[:ship_id])
    end
    respond_with @reservations
  end

  def show
    respond_with @reservation
  end

  def create
    @reservation = Ship.create params
    respond_with @reservation
  end

  def update
    @reservation.update_attributes params
    respond_with @reservation
  end
end
