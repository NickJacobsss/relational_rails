class Trail < ApplicationRecord
  belongs_to :park
  validates_presence_of :name
  validates_presence_of :length
  validates_inclusion_of :hikable, :in => [true,false]
end
