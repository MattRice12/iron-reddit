class User < ApplicationRecord
  has_many :links
  has_many :comments
  has_many :upvotes
  has_many :downvotes
  has_many :comment_upvotes
  has_many :comment_downvotes

  validates :username, length: { minimum: 1, maximum: 20 }
  validates :password, length: { minimum: 1, maximum: 20 }
end
