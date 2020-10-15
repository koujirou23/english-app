class Tag < ApplicationRecord
  has_many :posts, through: :post_tag
  has_many :post_tags

  validates :name, uniqueness: true
end
