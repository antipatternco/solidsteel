require 'rails_helper'

feature "UserCanViewASinglePartOfABroadcasts", :type => :feature do
  scenario "User visits broadcast part page" do
	broadcast = FactoryGirl.create(:broadcast_with_mixes)
	visit "/broadcasts/#{broadcast.id}/mixes/#{broadcast.mixes.first.id}"
	expect(page).to have_text("solid steel broadcast part page")
  end

  scenario "User visits invalid broadcast/part url" do
    broadcast = FactoryGirl.create(:broadcast_with_mixes)

    # visit a valid mix id at an invalid broadcast id
	visit "/broadcasts/abc/mixes/#{broadcast.mixes.first.id}"
	expect(page).to have_text("The page you were looking for doesn't exist")
  end
end
