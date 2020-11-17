class Plane < ApplicationRecord
  belongs_to :airline
  has_many :bookings
  self.inheritance_column = :type
end
