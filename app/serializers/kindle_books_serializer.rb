class KindleBooksSerializer < ActiveModel::Serializer
  attributes :id, :title, :author
  has_many :kindle_notes

  def kindle_notes
    object.kindle_notes.active
  end
end
