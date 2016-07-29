class Link < ApplicationRecord
  belongs_to :board
  has_many :upvotes
  has_many :downvotes
  has_many :comments
  paginates_per 20

  validates :title, length: { minimum: 1, maximum: 200 }
end
