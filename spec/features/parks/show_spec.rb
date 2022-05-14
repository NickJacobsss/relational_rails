require 'rails_helper'

RSpec.describe "the parks show page" do
  before :each do
    @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    @grand_canyon = Park.create!(name:'Grand Canyon', open:true, size:1902)
    @falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:@yosemite.id)
    @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
  end

  it "displays park attributes" do
    visit "/parks/#{@yosemite.id}"

    expect(page).to have_content(@yosemite.name)
    expect(page).to have_content(@yosemite.open)
    expect(page).to have_content(@yosemite.size)
    expect(page).to_not have_content(@grand_canyon.name)
  end

  it "displays how many trails each park has " do
    visit "/parks/#{@yosemite.id}"
    expect(page).to have_content("Trails Available: 2")
  end

  describe 'links' do

    it "links to Parks Index page" do
      visit "/parks/#{@yosemite.id}"
      click_on 'Parks Index'
      expect(current_path).to eq('/parks/')
    end

    it "links to Trails Index page" do
      visit "/parks/#{@yosemite.id}"
      click_on 'Trails Index'
      expect(current_path).to eq('/trails/')
    end

    it "links to trails at a specific park id" do
      visit "/parks/#{@yosemite.id}"
      click_on 'Trails at this Park'
      expect(current_path).to eq("/parks/#{@yosemite.id}/trails")
    end
  end
end
