class Food < ApplicationRecord
  has_many :feedings
  has_many :edibles
  has_many :pets, through: :edibles
end
