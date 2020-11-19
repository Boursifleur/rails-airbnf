class Plane < ApplicationRecord
  belongs_to :airline
  has_many :bookings
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
