class Family < ApplicationRecord
  has_many :user_families
  has_many :users, through: :user_families
  has_many :stories
  has_many :recipes
  has_many :photos
end
