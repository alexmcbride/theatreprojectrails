class Category < ApplicationRecord
  resourcify

  validates :name, presence: true, uniqueness: true

  has_many :posts

  def approved_posts
    self.posts.where('is_approved=1')
  end
end
