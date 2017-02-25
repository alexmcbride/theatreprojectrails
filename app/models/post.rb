class Post < ApplicationRecord
  resourcify

  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true

  def self.all_approved
    Post.all.where('is_approved=1')
  end
end
