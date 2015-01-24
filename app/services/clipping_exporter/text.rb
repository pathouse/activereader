require 'rubygems'
require 'zip'

class ClippingExporter::Text 

  attr_reader :books

  def initialize(user)
    @books = user.kindle_books.includes(:kindle_notes)
  end

  def export
    create_zipfile
  end

  private

  def create_zipfile
    temp = Tempfile.new("zip-export-#{Time.now}")
    write_notes_to_zip(temp)
    return temp
  end


  # TODO - BROKEN
  # read this http://thinkingeek.com/2013/11/15/create-temporary-zip-file-send-response-rails/
  def write_notes_to_zip(temp_file)
   

    # initialize the zipfile
    Zip::File.open(temp_file.path, Zip::File::CREATE) { |z| }
   
    # write contents to the zip file
    Zip::OutputStream.open(temp_file.path) do |zip|
      books.each do |book|
        book.kindle_notes.map do |note|
          zip.put_next_entry note_entry_name(note)
          zip.print note_tempfile(note)
        end
      end
    end
  end

  def note_entry_name(note)
    note_filename = ["page", note.page_number, note.annotated_at.to_s].join("_")
    foldername = note.kindle_book.title.split(" ").join("-")
    [foldername, "#{note_filename}.txt"].join("/")
  end

  def formatted_note_data(note)
    [note.content, 
     "Page #{note.page_number}", 
     note.annotated_at.stamp("March 31, 1990")].join('\n')
  end
end
