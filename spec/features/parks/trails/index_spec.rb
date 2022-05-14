require 'rails_helper'

RSpec.describe 'Parks Trails Index' do
  before :each do
    @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    @falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:@yosemite.id)
    @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
  end
  it "shows all trails a park has" do
    visit "/parks/#{@yosemite.id}/trails"

    expect(page).to have_content(@falls.name)
    expect(page).to have_content(@half_dome.name)
  end

  describe 'links' do
    
    it 'links to each trails show page' do
      visit "/parks/#{@yosemite.id}/trails"
      click_on @falls.name
      expect(current_path).to eq("/trails/#{@falls.id}")
    end

    it "links to Parks Index page" do
      visit "/parks/#{@yosemite.id}/trails"
      click_on 'Parks Index'
      expect(current_path).to eq('/parks/')
    end

    it "links to Trails Index page" do
      visit "/parks/#{@yosemite.id}/trails"
      click_on 'Trails Index'
      expect(current_path).to eq('/trails/')
    end
  end
end
