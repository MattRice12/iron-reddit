class Link < ApplicationRecord
  has_many :votes

  validates :title, null: false
end
