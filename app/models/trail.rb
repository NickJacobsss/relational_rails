class Trail < ApplicationRecord
    belongs_to :park
    validates_presence_of :name
    validates_presence_of :length
    validates_inclusion_of :hikable, :in => [true,false]

    def self.only_true
      Trail.where(hikable: true)
    end

    def self.sort_alphabetically
      order(:name)
    end

    def self.minimum_length(minimum)
      where("length > ?", minimum)
    end 
  end
