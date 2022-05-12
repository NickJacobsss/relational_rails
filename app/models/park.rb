class Park < ApplicationRecord
  has_many :trails
  validates_presence_of :name
  validates_presence_of :size
  validates_inclusion_of :open, :in => [true,false]
end
