class Evernote::NoteStoreExplorer < Evernote::BaseExplorer

  attr_reader :note_store, :notebook_name
  attr_accessor :note_count

  def initialize(user)
    super(user)
    @note_store = @client.note_store
    @notebook_name = user.evernote_notebook_name
    @note_count = user.evernote_note_count
  end

  def notebook_list
    @notebook_list ||= @note_store.listNotebooks
  end

  def app_notebook
    @app_notebook ||= find_or_create_app_notebook
  end

  # NoteList struct
  # http://dev.evernote.com/doc/reference/NoteStore.html#Struct_NoteList
  def app_note_list
    @app_note_list ||= get_app_note_list
  end

  def app_notes
    @app_notes ||= app_note_list.notes
  end

  def create_note(title, enml_note)
    note = Evernote::EDAM::Type::Note.new
    note.title = title
    note.content = enml_note
    note.notebookGuid = app_notebook.guid
    note_store.createNote(note)
  end

  private

  def has_app_notebook?(list)
    list.any? { |nb| is_app_notebook?(nb) }
  end

  def is_app_notebook?(notebook)
    notebook.name == notebook_name
  end

  def find_or_create_app_notebook
    guid = if has_app_notebook?(notebook_list)
      notebook = notebook_list.detect { |nb| is_app_notebook?(nb) }
      notebook.guid
    else
      created_notebook = create_app_notebook
      created_notebook.guid
    end
    note_store.getNotebook(guid)
  end

  # returns some info about newly created notebook
  def create_app_notebook
    new_notebook = Evernote::EDAM::Type::Notebook.new
    new_notebook.name = notebook_name
    note_store.createNotebook(new_notebook)
  end

  def get_app_note_list
    note_filter = Evernote::EDAM::NoteStore::NoteFilter.new
    note_filter.notebookGuid = app_notebook.guid
    note_store.findNotes(note_filter, 0, note_count)
  end

end