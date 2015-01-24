class KindleNote < ActiveRecord::Base

  belongs_to :kindle_book

end

# == Schema Information
#
# Table name: kindle_notes
#
#  id             :integer          not null, primary key
#  kindle_book_id :integer
#  content        :text
#  page_number    :string(255)
#  location_info  :string(255)
#  annotated_at   :datetime
#  created_at     :datetime
#  updated_at     :datetime
#
