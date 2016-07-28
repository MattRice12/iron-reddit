class Link < ApplicationRecord
  has_many :votes
  paginates_per 20

  validates :title, null: false
end
