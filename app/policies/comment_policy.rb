class CommentPolicy < ApplicationPolicy
  def create?
    @user.has_role? :member
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end