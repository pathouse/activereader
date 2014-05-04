require "spec_helper"

describe KindleRawClipping do
  let(:mock_path) { File.expand_path("../../support/clippings", __FILE__) }
  let(:mock_file) { File.new(File.join(mock_path, "test-clippings.txt")) }

  describe "#parse_raw_clippings" do
    
    it "should create KindleBooks from a raw clip file" do
      expect {
        Fabricate(:kindle_raw_clipping, clipping_file: mock_file)
      }.to change { KindleBook.count }.by(3)
    end

    it "should create KindleNotes from a raw clip file" do
      expect {
        Fabricate(:kindle_raw_clipping, clipping_file: mock_file)
      }.to change { KindleNode.count }.by(4)
    end
  end
end