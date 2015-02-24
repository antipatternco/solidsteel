require 'rails_helper'

feature "MixPageShowsTrackListings", :type => :feature do
  scenario "User visits mix page" do
	broadcast = FactoryGirl.create(:broadcast_with_mixes_with_tracks)
	visit "/broadcasts/#{broadcast.id}/mixes/#{broadcast.mixes.first.id}"
	expect(page).to have_text("solid steel broadcast part page")
	expect(page).to have_selector("#tracklist")
	expect(page).to have_selector(".track", count: 5)
  end
end
