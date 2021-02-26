require 'rails_helper'

describe "user can search for nearest petrol station" do
  scenario "and see details of that station and travel details" do
    visit '/'

    click_button("Find Nearest Station")

    expect(current_path).to eq(search_path)

    expect(page).to have_css('.name')
    expect(page).to have_css('.address')
    expect(page).to have_css('.fuel_type')
    expect(page).to have_css('.access_time')

    expect(page).to have_content("Distance to nearest station in miles: 0.1")
    expect(page).to have_content("Travel time to nearest station in mins: 1")
    expect(page).to have_content("Travel directions to get to the fuel station: Turn left onto Lawrence St Destination will be on the left")
  end
end