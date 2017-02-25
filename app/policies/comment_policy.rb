class CommentPolicy < ApplicationPolicy
  def create?
    @user.has_role? :member
  end

  def edit?
    @user.has_role? :admin# or @user.has_role? :can_edit, @record
  end

  def update?
    @user.has_role? :admin# or @user.has_role? :can_edit, @record
  end

  def destroy?
    @user.has_role? :admin# or @user.has_role? :can_edit, @record
  end

  class Scope < Scope
    def resolve
      if user.nil?
        return scope.all_approved
      end

      if user.has_role? :admin
        return scope.all
      end

      if user.has_role? :member
        scope.all_user user.id
      end
    end
  end
end