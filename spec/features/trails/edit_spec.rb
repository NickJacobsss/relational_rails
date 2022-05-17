require 'rails_helper'

RSpec.describe "Edit Trails" do
  before :each do
    @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    @falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:@yosemite.id)
    @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
  end
  
  describe 'edit & update trails' do
    it "can update an existing trail" do
      visit "/trails/#{@half_dome.id}"
      click_on 'Update Trail Information'
      expect(current_path).to eq("/trails/#{@half_dome.id}/edit")
      fill_in("name", with: "Test Name")
      fill_in("hikable", with: true)
      fill_in("length", with: 7)
      click_button("Submit")
      expect(current_path).to eq("/trails/#{@half_dome.id}")
      expect(page).to have_content("Test Name")
      expect(page).to_not have_content("Half Dome")
    end
  end
end
