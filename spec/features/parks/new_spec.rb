require 'rails_helper'

RSpec.describe "Parks Creation Page", type: :feature do

  it "can create a new artist" do
    visit "/parks/new"
    fill_in("name", with: "Rocky National Park")
    fill_in("open", with: true )
    fill_in("size", with: 415)
    click_button("Create Park")

    expect(current_path).to eq("/parks/")
    expect(page).to have_content("Rocky National Park")
  end
end
