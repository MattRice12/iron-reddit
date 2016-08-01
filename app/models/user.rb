class User < ApplicationRecord
  include Clearance::User

  has_many :links, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :upvotes, :dependent => :destroy
  has_many :downvotes, :dependent => :destroy
  has_many :comment_upvotes, :dependent => :destroy
  has_many :comment_downvotes, :dependent => :destroy

  validates :username, length: { minimum: 1, maximum: 30 }
  validates :email, length: { minimum: 1, maximum: 50 }
  validates :password, length: { minimum: 1, maximum: 20 }
end
