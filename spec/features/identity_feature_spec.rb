require 'spec_helper'

describe "User pages", :type => :feature do

  let(:user) { FactoryGirl.create(:identity) }

  it "allows user to register" do
    visit '/sign_up'
    fill_in 'Name', :with => "Extreemnegro"
    fill_in 'Email', :with => "user@example.com"
    fill_in 'Password', :with => "p4ssw0rd"
    fill_in 'Password confirmation', :with => "p4ssw0rd"
    click_button "Register"
    page.should have_content "Logged in!"
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
    page.should have_content "Authentication failed, please try again. Did you input correct password and email?"
  end
  
end