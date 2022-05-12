require 'rails_helper'

# User Story 2, Parent Show
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

RSpec.describe "the parks show page" do
  it "displays park attributes" do
    yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    grand_canyon = Park.create!(name:'Grand Canyon', open:true, size:1902)
    visit "/parks/#{yosemite.id}"

    expect(page).to have_content(yosemite.name)
    expect(page).to have_content(yosemite.open)
    expect(page).to have_content(yosemite.size)
    expect(page).to_not have_content(grand_canyon.name)
  end
end
