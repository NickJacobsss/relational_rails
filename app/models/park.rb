class Park < ApplicationRecord
  has_many :trails
  validates_presence_of :name
  validates_presence_of :size
  validates_inclusion_of :open, :in => [true,false]

  def self.ordered
    order(created_at: :desc)
  end

  def trail_count
    trails.count
  end
end
