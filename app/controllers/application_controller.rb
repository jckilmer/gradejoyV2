class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  respond_to :html, :js, :json

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || courses_path
  end

  def permission_denied
    head :forbidden
  end
end
