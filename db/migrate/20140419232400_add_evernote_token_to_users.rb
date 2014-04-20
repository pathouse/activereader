class AddEvernoteTokenToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :username
    add_column :users, :evernote_token, :string
  end
end
