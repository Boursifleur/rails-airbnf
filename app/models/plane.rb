class Plane < ApplicationRecord
  belongs_to :airline
  has_many :bookings
end
