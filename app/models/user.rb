class User < ApplicationRecord
  has_many :feedings
  has_many :feedable
  has_many :pets, through: :feedable
end
