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
end
