class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    begin
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if !@user.active
        flash[:error] = "You got banned"
        redirect_to new_user_session_path
      else
        sign_in @user, :event => :authentication
        set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
        redirect_to root_path
      end
    rescue
      set_flash_message(:error, "Broken Google Oauth", kind: "Google") if is_navigational_format?
      redirect_to new_user_session_path
    end
  end

end
