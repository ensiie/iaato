class Api::V1::OperatorsController < Api::V1::V1Controller
  load_and_authorize_resource

  def index
    respond_with @operators
  end
end
