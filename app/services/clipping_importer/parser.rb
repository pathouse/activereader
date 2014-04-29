class ClippingImporter::Parser

  SECTION_DIV = "=========="
  
  attr_reader :clip_path

  def initialize(path)
    @clip_path = path
  end

  def parse
    file_ary = segment(read_path)
    clip_array = split_and_group(file_ary)
  end

  private

  def read_path
    File.new(clip_path).read
  end

  def segment(str)
    str.split(/\r\n/).keep_if {|e| !e.empty? }
  end

  def split_and_group(ary)
    temp = []
    grouped_ary = ary.each_with_object([]) do |element, final|
      unless element == SECTION_DIV
        temp << element
      else
        final << temp
        temp = []
      end
    end
  end
end

