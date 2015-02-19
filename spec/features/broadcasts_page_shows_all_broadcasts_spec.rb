require 'rails_helper'

feature "Broadcasts Page Shows All Broadcasts", :type => :feature do
  scenario "User visits broadcasts page" do
    
    FactoryGirl.create_list(:broadcast, 10)

    visit "/broadcasts"

    expect(page).to have_text("solid steel broadcasts")
    expect(page).to have_selector(".broadcasts li", count: 10)
  end
end
