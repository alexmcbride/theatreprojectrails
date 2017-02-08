class PostPolicy < ApplicationPolicy
  def edit?
    @user.has_role? :admin or @user.has_role? :can_edit, @record
  end

  def update?
    @user.has_role? :admin or @user.has_role? :can_edit, @record
  end

  def destroy?
    @user.has_role? :admin or @user.has_role? :can_edit, @record
  end
end