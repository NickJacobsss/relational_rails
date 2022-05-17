require 'rails_helper'

RSpec.describe 'The trails index page', type: :feature do
  before (:each) do
    @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    @grand_canyon = Park.create!(name:'Grand Canyon', open:true, size:1902)
    @zion = Park.create!(name:'Zion', open:false, size:229)
    @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
    @falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:@yosemite.id)
    @ooh_ahh = Trail.create!(name:"OOH AHH Point", hikable:true, length:2, park_id:@grand_canyon.id)
    @bright_angel = Trail.create!(name:'Bright Angel Trail', hikable: false, length:15, park_id:@grand_canyon.id)
    @angels_landing = Trail.create!(name:"Angel Landing",hikable:true,length:5, park_id:@zion.id)
    @observation_point = Trail.create!(name:"Observation Point",hikable:true,length:8, park_id:@zion.id)
  end

  it "displays the names of each trail" do
    visit '/trails'
    expect(page).to have_content(@half_dome.name)
    expect(page).to have_content(@falls.name)
    expect(page).to have_content(@ooh_ahh.name)
    # expect(page).to have_content(@bright_angel.name)
    expect(page).to have_content(@angels_landing.name)
    expect(page).to have_content(@observation_point.name)
  end

  describe 'links' do

    it "links to Parks Index page" do
      visit "/trails/"
      click_on 'Parks Index'
      expect(current_path).to eq('/parks/')
    end

    it "links to Trails Index page" do
      visit "/trails/"
      click_on 'Trails Index'
      expect(current_path).to eq('/trails/')
    end
  end

  describe 'sorting' do
    it "only shows hikable:true records " do
      visit "/trails/"
      expect(page).to have_content(@falls.name)
      expect(page).to have_content(@ooh_ahh.name)
      expect(page).to_not have_content(@bright_angel.name)
    end
  end

  describe "deletion" do
    it "can delete parent from index page " do
      Trail.destroy_all
      @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
      visit "/trails"
      click_button("Delete Trail")
      expect(current_path).to eq('/trails')
      expect(page).to_not have_content("Half Dome")
    end
  end
end
