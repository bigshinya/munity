class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters


    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email,:password, :password_confirmation, :name, :provider, :uid, user_image_attributes: [:id, :image, :user_id])}

    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :name, user_image_attributes: [:id, :image, :user_id, :_destroy])}
  end

  def get_client_for_octokit
    if Rails.env.production?
      client = Octokit::Client.new :access_token => ENV["GITHUB_ACCESS_TOKEN"] #request.env[:access_token]
    else
      client = Octokit::Client.new :access_token => Rails.application.secrets.dev_github_access_token #request.env[:access_token]
    end
  end
end
