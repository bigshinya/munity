class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def configure_permitted_parameters
      # sign up
      devise_parameter_sanitizer.for(:sign_up) << :first_name
      devise_parameter_sanitizer.for(:sign_up) << :last_name
      devise_parameter_sanitizer.for(:sign_up) << :age
      devise_parameter_sanitizer.for(:sign_up) << :sex
      devise_parameter_sanitizer.for(:sign_up) << :nationality
      devise_parameter_sanitizer.for(:sign_up) << :type

      # sign in
      devise_parameter_sanitizer.for(:sign_in) << :first_name
      devise_parameter_sanitizer.for(:sign_in) << :last_name
      devise_parameter_sanitizer.for(:sign_in) << :age
      devise_parameter_sanitizer.for(:sign_in) << :sex
      devise_parameter_sanitizer.for(:sign_in) << :nationality
      devise_parameter_sanitizer.for(:sign_in) << :type

      # sign in
      devise_parameter_sanitizer.for(:account_update) << :first_name
      devise_parameter_sanitizer.for(:account_update) << :last_name
      devise_parameter_sanitizer.for(:account_update) << :age
      devise_parameter_sanitizer.for(:account_update) << :sex
      devise_parameter_sanitizer.for(:account_update) << :nationality
      devise_parameter_sanitizer.for(:account_update) << :type      
    end
end
