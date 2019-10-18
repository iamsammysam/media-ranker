require "test_helper"

describe User do
  describe "validations" do 
    before do
      @user = User.new(name: "test user")
    end
    
    it "is valid when all fields are present" do
      result = @user.valid?
      expect(result).must_equal true
    end
    
    it "is invalid without a name" do 
      @user.name = nil
      result = @user.valid?
      expect(result).must_equal false
    end 
    
    it "is invalid if the name is not unique" do
      @user.name = users(:ada).name
      expect(@user.valid?).must_equal false
      expect(@user.errors.messages).must_include :name
    end
  end 
end 
