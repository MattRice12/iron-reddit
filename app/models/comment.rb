class Comment < ApplicationRecord
  belongs_to :link
  belongs_to :user
  has_many :upvotes
  has_many :downvotes

  validates :body, null: false

end
