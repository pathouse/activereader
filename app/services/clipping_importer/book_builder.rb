class ClippingImporter::BookBuilder

  attr_reader :clipping_collection, :user

  def initialize(collection, user)
    @clipping_collection = collection
    @user = user
  end

  def build!
    book = create_book_for(clipping_collection.first)
    clipping_collection.each { |c| create_note_for(c, book) }
  end
     
  private

  def create_book_for(clip)
    KindleBook.create(title: clip.source, author: clip.author, user: user)
  end

  def create_note_for(clip, book)
    KindleNote.create(kindle_book: book, content: clip.quote, page_number: clip.page_number,
                      location_info: clip.location, annotated_at: clip.date_object)
  end

end