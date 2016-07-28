class CommentDownvote < ApplicationRecord
  belongs_to :user
  belongs_to :comments, counter_cache: true
end
