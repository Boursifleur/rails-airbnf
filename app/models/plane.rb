class Plane < ApplicationRecord
  belongs_to :airline
  has_many :bookings
  has_one_attached :photo
end
