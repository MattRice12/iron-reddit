class Comment < ApplicationRecord
  belongs_to :link
  belongs_to :user
  has_many :comment_upvotes, :dependent => :destroy
  has_many :comment_downvotes, :dependent => :destroy

  validates :body, null: false

  def as_json(_ = nil)
    super(include: [:body, :link_id])
  end

end
