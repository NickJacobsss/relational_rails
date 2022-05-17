require 'rails_helper'

RSpec.describe 'Park Trails New Page' do
  before :each do
    @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    @falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:@yosemite.id)
    @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
  end

  it "can create a new trail for parent park" do
    visit "/parks/#{@yosemite.id}/trails/new"
    fill_in("name", with: "Mirror Lake")
    fill_in("hikable", with: true )
    fill_in("length", with: 3)
    click_button("Create Trail")

    expect(current_path).to eq("/parks/#{@yosemite.id}/trails")
    expect(page).to have_content("Mirror Lake")
  end
end
