class User < ApplicationRecord
  has_many :user_families
  has_many :families, through: :user_families


end
