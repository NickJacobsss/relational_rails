require 'rails_helper'

RSpec.describe "the trails show page" do
  before :each do
    @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    @falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:@yosemite.id)
    @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
  end

  describe "destroy" do
    it "can destroy a trail" do
      visit "/trails/#{@falls.id}"
      click_button 'Delete Trail'
      expect(current_path).to eq('/trails')
      expect(page).to_not have_content('Yosemite Falls')
    end
  end
end
