class User < ApplicationRecord
  rolify
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :username, presence: true, uniqueness: true

  has_many :posts
  has_many :comments

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end

  def clear_roles
    self.remove_role :admin
    self.remove_role :staff
    self.remove_role :member
  end

  def set_role(role)
    if role == 'Admin'
      self.add_role :admin
      self.add_role :staff
    elsif role == 'Staff'
      self.add_role :staff
    end
  end

  def get_role
    if self.has_role? :admin
      return 'Admin'
    end
    if self.has_role? :staff
      return 'Staff'
    end
    'Member'
  end
end
