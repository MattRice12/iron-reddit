class Board < ApplicationRecord
  has_many :links
  paginates_per 20

  validates :name, length: { minimum: 1, maximum: 50 }

end
