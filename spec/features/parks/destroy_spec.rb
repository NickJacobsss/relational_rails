require 'rails_helper'

RSpec.describe "Destroying a park" do
  before :each do
    @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    @grand_canyon = Park.create!(name:'Grand Canyon', open:true, size:1902)
    @falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:@yosemite.id)
    @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
  end

  it "can delete a park" do
    visit "/parks/#{@yosemite.id}"
    click_button 'Delete Park'
    expect(current_path).to eq('/parks')
    expect(page).to_not have_content("Yosemite")
  end
end
