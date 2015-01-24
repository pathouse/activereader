class KindleNotesSoftDelete < ActiveRecord::Migration
  def change
    add_column :kindle_notes, :deleted_at, :datetime
  end
end
