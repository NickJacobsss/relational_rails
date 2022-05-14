require 'rails_helper'

RSpec.describe 'The parks index page', type: :feature do
  before (:each) do
    @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
    @grand_canyon = Park.create!(name:'Grand Canyon', open:true, size:1902)
    @zion = Park.create!(name:'Zion', open:false, size:229)
  end

  it "displays the names of each park" do
    visit '/parks'
    expect(page).to have_content(@yosemite.name)
    expect(page).to have_content(@grand_canyon.name)
    expect(page).to have_content(@zion.name)
  end

  it "shows parks in order by created_at and shows created at timestamp" do
    visit '/parks'
    expect(page).to have_content("Added at: #{@yosemite.created_at}")
    expect(page).to have_content("Added at: #{@grand_canyon.created_at}")
    expect(page).to have_content("Added at: #{@zion.created_at}")
    expect(@yosemite.name).to appear_before(@grand_canyon.name)
    expect(@grand_canyon.name).to appear_before(@zion.name)
    expect(@zion.name).not_to appear_before(@yosemite.name)
  end

  describe 'links' do

    it "links to Parks Index page" do
      visit "/parks/"
      click_on 'Parks Index'
      expect(current_path).to eq('/parks/')
    end

    it "links to Trails Index page" do
      visit "/parks/"
      click_on 'Trails Index'
      expect(current_path).to eq('/trails/')
    end
  end
end
