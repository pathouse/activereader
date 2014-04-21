class AddNotebookNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :evernote_notebook_name, :string
    add_column :users, :evernote_note_count, :integer, default: 0
  end
end
