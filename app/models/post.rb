class Post < ApplicationRecord
  resourcify

  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true

  def self.all_approved
    where(approved: true)
  end

  def self.all_user(user_id)
    all_approved.where('user_id=?', user_id)
  end
end
