class Api::ApiController < ApplicationController
  before_filter Proc.new { request.format = :json}
  respond_to :json
  self.responder = ::ApiResponder
end
