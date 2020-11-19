class PlanePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    # record.airline == user
    true
  end

  def create?
    return true
  end

  def update?
    record.airline == user
    # - record: the plane passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def my_planes?
    record.airline == user
  end

  def destroy?
    record.airline == user
  end
end
