require "spec_helper"

describe ClippingImporter do
  let(:user) { Fabricate(:user) }
  let(:mock_path) { File.expand_path("../../support/clippings", __FILE__) }
  let(:mock_file) { File.new(File.join(mock_path, "test-clippings.txt")) }

  skip "import!" do
  end

  skip "group_clippings_by_source" do
  end
end
