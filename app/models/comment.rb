class Comment < ApplicationRecord
  resourcify

  belongs_to :post
  belongs_to :user

  validates :content, presence: true

  def self.all_approved
    where(approved: true)
  end

  def self.all_user(user_id)
    where('approved=1 OR user_id=?', user_id)
  end
end
