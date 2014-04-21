class User::DashboardController < User::BaseController
  before_action :load_user
  before_action :authorize_user

  def show
    @note_titles = @user.evernote_note_titles
    @kindle_raw_clippings = @user.kindle_raw_clippings
  end

end