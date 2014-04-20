class EvernoteAuthController < ApplicationController
  before_action :set_user
  
  def callback
    authtoken = request.env['omniauth.auth']['credentials']['token']
    @user.update_attribute(:evernote_token, authtoken)
    flash[:notice] = "Evernote Account Successfully Authorized"
    redirect_to user_account_path(@user)
  end

  private

  def set_user
    @user = current_user
  end
end