require 'rails_helper'

feature "Homepage Shows Latest Mixes when", :type => :feature do
  scenario "User visits homepage" do
  	mix = Mix.create!(:name => "foo", :url => "http://foo", :broadcast_date => Date.parse("16/02/2015 15:00"))
    visit "/"
    expect(page).to have_text("solid steel homepage")
    expect(page).to have_selector(".latest-mix")
    #fill_in "Name", :with => "My Widget"
    #click_button "Create Widget"
  end
end



# RSpec.describe "home page", :type => :request do
#   it "displays latest mix" do
#     mix = Mix.create!(:name => "foo", :url => "12345")
#     visit "/"
#     expect(page).to have_selector(".latest-mix iframe")
#   end

#   DatabaseCleaner.clean
# end