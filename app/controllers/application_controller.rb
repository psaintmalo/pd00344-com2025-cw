class ApplicationController < ActionController::Base
  before_action :config_params, if: :devise_controller?

  protected

  def config_params
    attributes = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: attributes
    devise_parameter_sanitizer.permit :account_update, keys: attributes
  end

end
