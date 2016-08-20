class ApplicationController < ActionController::Base
  rescue_from ActionController::UnpermittedParameters do|exception|
    render json: { message: exception.message }, status: 422
  end

  def process(action, *args)
    super
  rescue AbstractController::ActionNotFound, ActiveRecord::RecordNotFound
    render json: { message: 'page not found' }, status: :not_found
  end
end
