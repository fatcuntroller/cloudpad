require 'spec_helper'

describe "Dashboard pages", :type => :feature do

  let(:user) { FactoryGirl.create(:identity) }
  let(:note) { FactoryGirl.create(:note)}
  before do 
    visit '/log_in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Log in"
  end
  
  it "Shows the username" do
    visit dashboard_root_url
    page.should have_content "Logged in as: #{user.name}"
  end
  
  it "Should have posting form" do
    visit dashboard_root_url
    page.should have_selector "form"
  end
  
  it "Should show a link and redirect to new page" do
    click_link "Something Somethins lolzy"
  end

  
end