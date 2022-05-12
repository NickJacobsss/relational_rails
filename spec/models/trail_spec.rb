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
end
