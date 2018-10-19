class Users::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    user = User.find_by_email(sign_in_params['email'])
    if user.active
      super
    else
      flash[:notice] = "You got banned"
      self.resource = warden.authenticate!(auth_options)
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end
end
