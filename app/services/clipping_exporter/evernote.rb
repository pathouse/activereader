class ClippingExporter::Evernote

  attr_reader :user, :evernote_explorer

  def initialize(user)
    @user = user
    @evernote_explorer = Evernote::NoteStoreExplorer.new(user)
  end

  def export!
    note_collection = user.kindle_books.map do |book|
      [book.title, ClippingExporter::ENMLWriter.new(book).write]
    end

    note_collection.each do |title_and_note|
      title, note = title_and_note
      evernote_explorer.create_note(title, note)
      user.evernote_note_count += 1
    end
    user.save
  end
end
