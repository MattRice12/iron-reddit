class Downvote < ApplicationRecord
  belongs_to :user
  belongs_to :link, counter_cache: true
end
