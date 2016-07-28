class Link < ApplicationRecord
  has_many :upvotes
  has_many :downvotes
  paginates_per 20

  validates :title, null: false
end
