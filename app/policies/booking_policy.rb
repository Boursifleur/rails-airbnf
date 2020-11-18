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
    true
  end

  def create?
    true
  end
end
