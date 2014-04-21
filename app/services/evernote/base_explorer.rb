class Evernote::BaseExplorer

  attr_reader :client

  def initialize(user)
    @client = EvernoteOAuth::Client.new(token: user.evernote_token)
  end

end