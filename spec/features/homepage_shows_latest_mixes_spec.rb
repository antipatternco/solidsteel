require 'rails_helper'

feature "Homepage shows latest broadcast", :type => :feature do
  scenario "User visits homepage" do
  	broadcast = Broadcast.create!(:session_name => "Mix 16th Feb", 
  								  :broadcast_date => Date.parse("16/02/2015 15:00")
  								 )

    broadcast2 = Broadcast.create!(:session_name => "Mix 15th Feb", 
                    :broadcast_date => Date.parse("15/02/2015 15:00")
                   )

	  mix1 = Mix.create(:name => "part 1",
 					  :url => "http://foo",
 					  :broadcast_id => broadcast.id
 					)
 	
 	  mix2 = Mix.create(:name => "part 2",
 					  :url => "http://bar",
 					  :broadcast_id => broadcast.id
 					)
    
    visit "/"
    expect(page).to have_text("solid steel homepage")
    expect(page).to have_text("Mix 16th Feb")
    expect(page).to have_selector(".latest-mix")
    expect(page).to have_selector(".part", count: 2)
    expect(page).to have_text("part 1")
    expect(page).to have_text("part 2")
  end
end