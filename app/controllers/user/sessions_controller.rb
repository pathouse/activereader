class User::SessionsController < Devise::SessionsController

  private 

  def after_sign_in_path_for(user)
    user_account_path(user)
  end

end