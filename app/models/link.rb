class Link < ApplicationRecord
  belongs_to :board
  has_many :upvotes, :dependent => :destroy
  has_many :downvotes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  paginates_per 20

  validates :title, length: { minimum: 1, maximum: 200 }
end
