class ClippingImporter
  class << self

    def import!(file_path, user)
      clipping_parser = ClippingImporter::Parser.new(file_path)
      clippings = clipping_parser.parse.map {|c| ClippingImporter::Clipping.new(c) }

      grouped_by_source = group_clippings_by_source(clippings)
      grouped_by_source.values.each do |clipping_collection|
        ClippingImporter::BookBuilder.new(clipping_collection, user).build!
      end
    end

    private

    def group_clippings_by_source(clippings)
      clippings.each_with_object({}) do |clipping, result|
        unless result.keys.include? clipping.source
          result[clipping.source] = [clipping]
        else
          result[clipping.source] << clipping
        end
      end
    end
  end
end
