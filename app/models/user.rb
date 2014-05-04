class User < ActiveRecord::Base
  #extend FriendlyId
  #friendly_id :name, use: [:slugged, :finders]

  before_create :set_default_notebook_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :kindle_raw_clippings
  has_many :kindle_books
  has_many :kindle_notes, through: :kindle_books

  def evernote_linked?
    !!evernote_token
  end

  # TODO - REFACTOR - PRESENTER METHOD
  def evernote_note_titles
    Rails.cache.fetch("#{cache_key}/evernote_note_titles", expires_in: 12.hours) do 
      Evernote::NoteStoreExplorer.new(self).app_notes.map {|n| n.title}
    end
  end

  private

  def set_default_notebook_name
    self.evernote_notebook_name ||= "ActiveReader Notebook"
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  evernote_token         :string(255)
#  evernote_notebook_name :string(255)
#  evernote_note_count    :integer          default(0)
#