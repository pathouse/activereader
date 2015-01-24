class KindleNoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :page_number, :location_info, :annotated_at

  def annotated_at
    object.annotated_at.stamp("Mar 31, 1990")
  end
end
