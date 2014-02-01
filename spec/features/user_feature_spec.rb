require 'spec_helper'

describe "User pages", :type => :feature do

  let(:user) { FactoryGirl.create(:user) }

  it "allows user to register" do
    visit '/sign_up'
    fill_in 'Email', :with => "user@example.com"
    fill_in 'Password', :with => "p4ssw0rd"
    fill_in 'Password confirmation', :with => "p4ssw0rd"
    click_button "Create User"
    page.should have_content "Signed up!"
  end
  
  it "allows user to login" do
    visit '/log_in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Save changes"
    page.should have_content "Logged in!"
  end
  
  it "doesn't let wrong passwords in" do
    visit '/log_in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => "wrongpassword"
    click_button "Save changes"
    page.should have_content "Invalid email or password"
  end
  
end