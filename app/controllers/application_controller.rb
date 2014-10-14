class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :username, :profile_photo]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :username, :profile_photo]
  end

  def authorize!
    if current_user.nil? or !current_user.is_admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    user_path(current_user)
  end
end
