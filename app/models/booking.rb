class Booking < ApplicationRecord
  belongs_to :plane
  belongs_to :airline
  
end
