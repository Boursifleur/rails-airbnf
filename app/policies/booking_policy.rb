class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(airline: user)
    end
  end
  # def index?
  #   true
  # end
  def new?
    record.plane.airline != user
  end

  def create?
    true
  end

  def update?
    record.plane.airline == user
  end

  def booking_accepted
    update?
  end

  def booking_refused
    update?
  end
end
