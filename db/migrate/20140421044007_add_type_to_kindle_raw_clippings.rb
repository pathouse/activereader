class AddTypeToKindleRawClippings < ActiveRecord::Migration
  def change
    add_column :kindle_raw_clippings, :type, :string
  end
end
