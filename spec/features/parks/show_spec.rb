require 'rails_helper'

RSpec.describe "the parks show page" do
  it "displays park attributes" do
    park = Park.create(name:'Yosemite', open:true, size:1187)
    visit "/parks/#{park.id}"
  end
end
