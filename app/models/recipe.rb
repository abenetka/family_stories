class Recipe < ApplicationRecord
  belongs_to :family

  validates_presence_of :title, :ingredients, :instructions
end
