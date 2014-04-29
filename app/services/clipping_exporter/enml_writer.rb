class ClippingExporter::ENMLWriter
  include ClippingExporter::FormattingMethods::ENML
  include ClippingExporter::FormattingMethods::HTML

  attr_accessor :book

  def initialize(book)
    @book = book
  end

  def write
    en_note do
      element_group h1 { book.title },
                    hr,
                    book.kindle_notes.map {|note| write_note(note)}
    end
  end

  def write_note(note)
    div do 
      element_group p { note.content },
                    p(style: "'color: rgb(153, 153, 153);'") { em { note.page_number || "" } },
                    p(style: "'color: rgb(153, 153, 153);'") { em { note.annotated_at.stamp("Mar 31, 1990") || "" } },
                    hr, br
    end
  end
end

