require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :length}
    it { should allow_value(true).for :hikable}
    it { should allow_value(false).for :hikable}
    it { should_not allow_value(nil).for :hikable}
  end

  describe 'relationships' do
    it { should belong_to :park}
  end

  describe 'methods' do
    it "only shows records that have hikable: true" do
      grand_canyon = Park.create!(name:'Grand Canyon', open:true, size:1902)
      ooh_ahh = Trail.create!(name:"OOH AHH Point", hikable:true, length:2, park_id:grand_canyon.id)
      bright_angel = Trail.create!(name:'Bright Angel Trail', hikable: false, length:15, park_id:grand_canyon.id)
      expect(Trail.only_true).to eq([ooh_ahh])
    end

    it 'sorts park-trails alphebetically' do
      yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
      falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:yosemite.id)
      half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:yosemite.id)
      test_trail = Trail.create!(name: 'Test',hikable:true, length:100, park_id:yosemite.id)
      expect(yosemite.trails.sort_alphabetically).to eq([half_dome,test_trail,falls])
    end

    it "can filter for minimum trail distance" do
      yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
      falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:yosemite.id)
      half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:yosemite.id)
      test_trail = Trail.create!(name: 'Test',hikable:true, length:100, park_id:yosemite.id)
      expect(Trail.minimum_length(18)).to eq([test_trail])
    end
  end
end
