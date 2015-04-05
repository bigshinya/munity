class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_github_oauth(request.env["omniauth.auth"])
 
    # github access_token$B<hF@(B
    # @octokit_client = Octokit::Client.new :access_token => request.env["omniauth.auth"][:credentials][:token]
    session[:access_token] = request.env["omniauth.auth"][:credentials][:token]

    if @user.persisted?
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

  end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
