class PlanePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      scope.where(airline: user)
    end
  end

  def show?
    record.airline == user
  end

  def create?
    return true
  end

  def update?
    record.airline == user
    # - record: the plane passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.airline == user
  end
end
