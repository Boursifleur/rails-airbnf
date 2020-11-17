class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(airline: user)
    end
  end
  # def index?
  #   true
  # end
end
