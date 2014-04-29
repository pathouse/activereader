class ClippingImporter

  attr_reader :file, :user

  def initialize(file, user)
    @file = file
    @user = user
  end

  def create_books_and_notes!
    clipping_parser = ClippingImporter::Parser.new(file.path)
    clippings = clipping_parser.parse.map {|c| ClippingImporter::Clipping.new(c) }
    
    grouped_by_source = group_clippings_by_source(clippings)

    grouped_by_source.values.each do |clipping_collection|
      ClippingImporter::BookBuilder.new(clipping_collection, user).build!
    end
  end

  private

  def group_clippings_by_source(clippings)
    clippings.each_with_object({}) do |clip, hsh|
      unless hsh.keys.include? clip.source
        hsh[clip.source] = [clip]
      else
        hsh[clip.source] << clip
      end
    end
  end

end