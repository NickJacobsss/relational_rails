require 'rails_helper'

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

  it "displays how many trails each park has " do
    yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:yosemite.id)
    half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:yosemite.id)
    visit "/parks/#{yosemite.id}"
    expect(page).to have_content("Trails Available: 2")
  end
end
