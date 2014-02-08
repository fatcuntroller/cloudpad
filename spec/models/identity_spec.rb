require 'spec_helper'

describe Identity do
  before {@identity = Identity.new(name: "TestUser", email: "identity@example.com", password: "haxpassword", password_confirmation: "haxpassword")}

  subject {@identity}
  
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:name) }
  
  it { should be_valid }
  
  describe "saved" do
    before do
      @identity.save
    end
    
    it { should be_valid }
  end
  
  describe "with a wrong email address" do
    before do
      @identity.email = "notanemail.fuck"
    end
    
    it { should_not be_valid }
  end 
  
  describe "with a duplicate email" do
    before do 
      @identitydup = @identity.dup
      @identitydup.email = "Identity@eXample.com"
      @identitydup.save
    end
    
    it { should_not be_valid }
  end
  
  describe "with a password too short" do
    before do
      @identity.password = "a" * 4
    end
        
    it { should_not be_valid }    
  end
  
  describe "with a mismatching confirmation" do
    before do
      @identity.password_confirmation = "nananabatman"
    end
      
    it { should_not be_valid }
  end
end