require 'rails_helper'

RSpec.describe "the trails show page" do
  before :each do
    @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    @falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:@yosemite.id)
    @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
  end

  it "displays park attributes" do
    visit "/trails/#{@half_dome.id}"

    expect(page).to have_content(@half_dome.name)
    expect(page).to have_content(@half_dome.length)
    expect(page).to have_content(@half_dome.hikable)
    expect(page).to_not have_content(@falls.name)
  end

  describe 'links' do

    it "links to Parks Index page" do
      visit "/trails/#{@half_dome.id}"
      click_on 'Parks Index'
      expect(current_path).to eq('/parks/')
    end

    it "links to Trails Index page" do
      visit "/trails/#{@half_dome.id}"
      click_on 'Trails Index'
      expect(current_path).to eq('/trails/')
    end
  end
end
