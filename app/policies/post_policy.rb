class PostPolicy < ApplicationPolicy
  def new?
    @user.has_role? :staff
  end

  def create?
    @user.has_role? :staff
  end

  def edit?
    @user.has_role? :admin or @user.has_role? :can_edit, @record
  end

  def update?
    @user.has_role? :admin or @user.has_role? :can_edit, @record
  end

  def destroy?
    @user.has_role? :admin or @user.has_role? :can_edit, @record
  end

  class Scope < Scope
    def resolve
      if user.nil? or user.has_role? :member
        return scope.all_approved
      end

      if user.has_role? :admin
        return scope.all
      end

      if user.has_role? :staff
        scope.all_user user.id
      end
    end
  end
end