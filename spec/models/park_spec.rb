require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :size}
    it { should allow_value(true).for :open}
    it { should allow_value(false).for :open}
    it { should_not allow_value(nil).for :open}
    end

  describe 'relationships' do
    it { should have_many :trails}
  end

  describe 'instance methods' do
    describe '#trail_count' do
      before :each do
        @yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
        @falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id:@yosemite.id)
        @half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id:@yosemite.id)
      end

      it "counts total number of trails belonging to a specific park" do
        expect(@yosemite.trail_count).to eq(2)
      end
    end
  end
end
