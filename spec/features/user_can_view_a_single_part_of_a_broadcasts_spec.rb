require 'rails_helper'

feature "UserCanViewASinglePartOfABroadcasts", :type => :feature do
  scenario "User visits broadcast part page" do
  	
  	broadcast = FactoryGirl.create(:broadcast_with_mixes)
    
    puts broadcast.inspect

    visit "/broadcasts/#{broadcast.id}/mixes/#{broadcast.mixes.first.id}"
    expect(page).to have_text("solid steel broadcast part page")
  end
end
