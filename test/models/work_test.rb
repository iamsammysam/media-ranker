require "test_helper"

describe Work do
  describe "validations" do 
    before do
      @work = Work.new(category: "music", title: "smaple title", creator: "sample creator", description: "great music", publication_year: 2000)
    end
    
    it "is valid when all fields are present" do
      result = @work.valid?
      expect(result).must_equal true
    end
    
    it "is invalid without a title" do 
      @work.title = nil
      result = @work.valid?
      expect(result).must_equal false
    end 
    
    it "is valid without a creator" do
      @work.creator = nil
      result = @work.valid?
      expect(result).must_equal false
    end
    
    it "is valid without a description" do
      @work.description = nil
      result = @work.valid?
      expect(result).must_equal false
    end
    
    it "is valid wihout a publication year" do
      @work.publication_year = nil
      result = @work.valid?
      expect(result).must_equal false
    end
    
    it "is invalid if the title is not unique" do
      @work.title = works(:toy).title
      expect(@work.valid?).must_equal false
      expect(@work.errors.messages).must_include :title
    end
  end 
end
