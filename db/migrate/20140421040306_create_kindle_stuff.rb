class CreateKindleStuff < ActiveRecord::Migration
  def change
    create_table :kindle_raw_clippings do |t|
      t.attachment :clipping_file
      t.integer :user_id

      t.timestamps
    end

    create_table :kindle_books do |t|
      t.integer :user_id
      t.string :title
      t.string :author

      t.timestamps
    end

    create_table :kindle_notes do |t|
      t.integer :kindle_book_id
      t.text :content
      t.string :page_number
      t.string :location_info
      t.datetime :annotated_at

      t.timestamps
    end
  end
end
