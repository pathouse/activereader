class KindleRawClipping < ActiveRecord::Base

  belongs_to :user
  has_attached_file :clipping_file
  validates_attachment_content_type :clipping_file, content_type: /\Atext\/plain\Z/

end

# == Schema Information
#
# Table name: kindle_raw_clippings
#
#  id                         :integer          not null, primary key
#  clipping_file_file_name    :string(255)
#  clipping_file_content_type :string(255)
#  clipping_file_file_size    :integer
#  clipping_file_updated_at   :datetime
#  user_id                    :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#  type                       :string(255)
#
