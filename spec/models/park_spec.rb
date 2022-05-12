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
end
