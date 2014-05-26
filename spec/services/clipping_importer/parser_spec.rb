require "spec_helper"

describe ClippingImporter::Parser do
  let(:test_clip_dir)  { File.expand_path("../../../support/clippings", __FILE__) }
  let(:test_clip_path) { File.new(File.join(test_clip_dir, "test-clippings.txt")) }
  let(:parser)         { ClippingImporter::Parser.new(test_clip_path) }
  
  describe "PUBLIC METHODS" do
    
    describe "initialization" do
      it "sets instance var clip_path to the path passed in on init" do
        expect(parser.clip_path).to eq(test_clip_path)
      end
    end
    
    # TODO - shared examples to use for this and split_and_group
    describe "#parse" do
      
      it "should read, segment, and group the contents of the file" do
        parsed = parser.parse
        
        array_of_arrays = parsed.all? { |i| i.is_a?(Array) }
        expect(array_of_arrays).to eq(true)
        
        three_sections = parsed.all? {|i| i.size == 3}
        expect(three_sections).to eq(true)
        
        no_divs = parsed.all? { |i| !i.include?("=" * 10) }
        expect(no_divs).to eq(true)
      end
    end
  end
  
  describe "PRIVATE METHODS" do 
    describe "#clip_contents" do
      it "should open the file and read its contents" do
        file_contents = parser.send(:clip_contents)
        expect(file_contents).to eq(File.new(test_clip_path).read)
      end
    end
    
    describe "#segment" do

      it "splits the string passed in by newlines and strip blank lines" do
        file_contents = File.new(test_clip_path).read
        segmented_string = parser.send(:segment, file_contents)
        
        expect(segmented_string.any? { |seg| seg.match(/\r\n/) }).to eq(false)
        expect(segmented_string.any?(&:blank?)).to eq(false)
      end
    end

    describe "#split_and_group" do
      
      before :each do
        file_contents = File.new(test_clip_path).read
        @segmented_string = parser.send(:segment, file_contents)
        @grouped_string = parser.send(:split_and_group, @segmented_string)
      end

      it "collects the segmented contents into an array for each quote" do
        section_count = @segmented_string.select {|e| e == ("=" * 10)}.count
        expect(@grouped_string.size).to eq(@segmented_string.size / section_count)
        expect(@grouped_string.all? { |item| item.is_a?(Array) }).to eq(true)
      end

      it "removes the section dividers" do
        div_present = @grouped_string.all? { |item| item.include?("=" * 10) }
        expect(div_present).to eq(false)
      end
      
      it "has three sections for each quote" do
        three_sections = @grouped_string.all? { |item| item.size == 3 }
        expect(three_sections).to eq(true)
      end
    end
  end
end
