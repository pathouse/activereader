class ClippingImporter::Parser

  SECTION_DIV = "=========="
  
  attr_reader :clip_path

  def initialize(path)
    @clip_path = path
  end

  def parse
    split_and_group(segment(clip_contents))
  end

  private

  def clip_contents
    File.new(clip_path).read
  end

  def segment(str)
    str.split(/\r\n/).keep_if {|e| !e.empty? }
  end

  def split_and_group(ary)
    temp = []
    ary.each_with_object([]) do |element, final|
      unless element == SECTION_DIV
        temp << element
      else
        final << temp
        temp = []
      end
    end
  end
end

