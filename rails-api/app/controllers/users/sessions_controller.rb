class Users::SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(sign_in_params['email'])
    if user.nil? || user.active
      super
    else
      flash[:error] = "You got banned"
      redirect_to action: "new"
    end
  end
end
