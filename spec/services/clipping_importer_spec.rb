require "spec_helper"

describe ClippingImporter do
  let(:user) { Fabricate(:user) }
  let(:mock_path) { File.expand_path("../../support/clippings", __FILE__) }
  let(:mock_file) { File.new(File.join(mock_path, "test-clippings.txt")) }

  describe "initialize" do
    it "should init with a file and a user" do
      importer = ClippingImporter.new(mock_file, user)
      expect(importer.file).to eq mock_file
      expect(importer.user).to eq user
    end
  end

  describe "create_books_and_notes!" do
  end

  describe "gorup_clippings_by_source" do
  end

end
