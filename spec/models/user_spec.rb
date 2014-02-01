require 'spec_helper'

describe User do
  before {@user = User.new(email: "user@example.com", password: "haxpassword", password_confirmation: "haxpassword")}

  subject {@user}
  
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  
  it { should be_valid }
  
  describe "saved" do
    before do
      @user.save
    end
    
    it { should be_valid }
  end
  
  describe "with a wrong email address" do
    before do
      @user.email = "notanemail.fuck"
    end
    
    it { should_not be_valid }
  end 
  
  describe "with a duplicate email" do
    before do 
      @userdup = @user.dup
      @userdup.email = "usEr@eXample.com"
      @userdup.save
    end
    
    it { should_not be_valid }
  end
  
  describe "with a password too short" do
    before do
      @user.password = "a" * 4
    end
        
    it { should_not be_valid }    
  end
  
  describe "with a mismatching confirmation" do
    @user.password_confirmation = "nananabatman"
        
    it { should_not be_valid }
  end
end
