class User < ActiveRecord::Base
  before_create :set_default_notebook_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def set_default_notebook_name
    self.evernote_notebook_name ||= "AdlerReader Notebook"
  end
end
