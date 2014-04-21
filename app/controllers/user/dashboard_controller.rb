class User::DashboardController < User::BaseController
  before_action :load_user
  before_action :authorize_user

  def show
    en_explorer = Evernote::NoteStoreExplorer.new(@user)
    @notes = en_explorer.app_notes
  end

end