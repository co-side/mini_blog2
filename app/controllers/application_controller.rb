class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[email]
    devise_parameter_sanitizer.permit :account_update, keys: %i[profile blog_url]
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.basic[:username] && password == Rails.application.credentials.basic[:password]
    end
  end
end
