class ApiResponder < ActionController::Responder
  def to_format
    case
    when has_errors?
      controller.response.status = :unprocessable_entity
    when post?
      controller.response.status = :created
    end

    default_render
  rescue ActionView::MissingTemplate => e
    api_behavior(e)
  end
end
