class Api::V1::ShipClassesController < Api::V1::V1Controller
  load_and_authorize_resource

  def index
    respond_with @ship_classes
  end
end
