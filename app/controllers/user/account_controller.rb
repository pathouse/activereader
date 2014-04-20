class User::AccountController < ApplicationController

  def show
    @user = User.find(params[:id])
    @evernote_connected = !!@user.evernote_token
  end

end