class Api::V1::ShipsController < Api::V1::V1Controller
  load_and_authorize_resource

  def index
    respond_with @ships
  end

  def show
    respond_with @ship
  end

  def create
    @ship = Ship.create params
    respond_with @ship
  end

  def update
    @ship.update_attributes params
    respond_with @ship
  end
end
