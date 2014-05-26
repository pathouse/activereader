require 'date'
require 'cgi'

class ClippingImporter::Clipping

  attr_accessor :source, :author, :metadata, :quote

  def initialize(clip_array)
    @source, @metadata, @quote = clip_array
    @quote = sanitize(@quote)
    @author = extract_author(@source)
    @source = clean_author(@source)
  end

  def page_number
    capture_from_string(metadata, /Page (\d+)/)
  end

  def date_string
    capture_from_string(metadata, /Added on (.*)$/)
  end

  def location
    capture_from_string(metadata, /(Loc. [\d-]+)/)
  end

  def date_object
    return false if date_string.empty?
    DateTime.strptime(date_string, '%A, %B %d, %Y, %I:%M %p')
  end

  private

  def extract_author(title)
    capture_from_string(title, /\((.*)\)/)
  end

  def clean_author(str)
    str.gsub(/\(.*\)/, '').strip
  end

  def sanitize(text)
    CGI::escapeHTML(text)
  end

  def capture_from_string(str, pattern)
    matchdata = str.match(pattern)
    matchdata.nil? ? false : matchdata[1]
  end
end
