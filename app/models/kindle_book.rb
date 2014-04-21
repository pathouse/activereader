class KindleBook < ActiveRecord::Base

  belongs_to :user
  has_many :kindle_notes

end

# == Schema Information
#
# Table name: kindle_books
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  author     :string(255)
#  created_at :datetime
#  updated_at :datetime
#