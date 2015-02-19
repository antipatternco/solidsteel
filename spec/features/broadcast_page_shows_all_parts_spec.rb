require 'rails_helper'

feature "BroadcastPageShowsAllParts", :type => :feature do
  scenario "User visits a single broadcast page" do
    
    broadcast = FactoryGirl.create(:broadcast_with_mixes, mixes_count: 3)

    visit "/broadcasts/#{broadcast.id}"

    expect(page).to have_text("solid steel single broadcast")
    expect(page).to have_selector("#broadcast")
    expect(page).to have_selector("#broadcast .part", count: 3)
  end
end
