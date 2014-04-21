class User::AccountController < User::BaseController
  before_action :load_user
  before_action :authorize_user

  def show
    @evernote_connected = !!@user.evernote_token
  end

end