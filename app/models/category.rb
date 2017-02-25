class Category < ApplicationRecord
  resourcify

  validates :name, presence: true, uniqueness: true

  has_many :posts
end
