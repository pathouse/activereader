require "spec_helper"

describe ClippingImporter::Clipping do
  let(:clip_ary) { ["The One World Schoolhouse: Education Reimagined (Salman Khan)",
                    "- Highlight on Page 39 | Loc. 424-27 | Added on Thursday, March 07, 2013, 03:58 PM",
                    "In a traditional academic model, the time alloted to learn something is fixed while the comprehension of the concept is variable. Washburne was advocating the opposite. What should be fixed is a high level of comprehension and what should be variable is the amount of time students have to understand a concept."] }

  let!(:clipping) { ClippingImporter::Clipping.new(clip_ary) }

  describe "initialize" do 
    describe "instance variables" do
      it "should set @source" do
        expect(clipping.source).to eq "The One World Schoolhouse: Education Reimagined"
      end

      it "should set @author" do
        expect(clipping.author).to eq "Salman Khan"
      end

      it "should set @metadata" do
        expect(clipping.metadata).to eq clip_ary[1]
      end

      it "should set @quote" do
        expect(clipping.quote).to eq clip_ary[2]
      end
    end
  end
  
  describe "PUBLIC METHODS" do 

    describe "page_number" do
      it "should extract page number from metadata" do
        expect(clipping.page_number).to eq "39"
      end 
    end

    describe "date_string" do
      it "should extract date info from metadata" do
        expect(clipping.date_string).to eq "Thursday, March 07, 2013, 03:58 PM"
      end 
    end

    describe "location" do
      it "should extract location info from metadata" do
        expect(clipping.location).to eq "Loc. 424-27"
      end 
    end

    describe "date_object" do
      it "should convert the date string into a ruby datetime object" do
        expect(clipping.date_object).to eq DateTime.new(2013, 3, 7, 15, 58, 0)
      end 
    end
  end

  describe "PRIVATE METHODS" do

    describe "capture_from_string" do
      it "applies a regex to a string and returns the matched group" do
        captured = clipping.send(:capture_from_string, "abc", /(a)/)
        expect(captured).to eq "a"
      end
        
      it "returns false if there is no match" do
        captured = clipping.send(:capture_from_string, "abc", /(z)/)
        expect(captured).to eq false
      end
    end  

    describe "extract_author" do
      it "extracts the content between parentheses in a string" do
        author = clipping.send(:extract_author, "Title of Book (Author)")
        expect(author).to eq "Author"
      end 
    end 

    describe "clean_author" do
      it "removes the author from the title" do
        title = clipping.send(:clean_author, "Title of Book (Author)")
        expect(title).to eq "Title of Book"
      end 
    end
  end
end
