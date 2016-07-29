class Comment < ApplicationRecord
  belongs_to :link
  belongs_to :user
  has_many :comment_upvotes
  has_many :comment_downvotes

  validates :body, null: false

end
