class Pet < ApplicationRecord
  has_many :feedings
  has_many :feedable
  has_many :edible
  has_many :users, through: :feedable
  has_many :foods, through: :edibles
end
