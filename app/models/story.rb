class Story < ApplicationRecord
  belongs_to :family

  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :author
end
