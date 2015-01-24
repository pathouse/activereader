require "spec_helper"

describe KindleRawClipping do
  describe "#parse_raw_clippings" do
     let(:mock_path) { File.expand_path("../../support/clippings", __FILE__) }
     let(:mock_file) { File.new(File.join(mock_path, "test-clippings.txt")) }

    it "should pass uploaded file to clipping importer after create" do
      expect_any_instance_of(KindleRawClipping).to receive(:parse_raw_clippings)
      Fabricate(:kindle_raw_clipping, clipping_file: mock_file)
    end

    describe "creating books and notes" do
      before :each do
        allow_any_instance_of(KindleRawClipping).to receive(:clipping_file)
          .and_return(mock_file)
      end
    end
  end
end

