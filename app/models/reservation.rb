class ReservationUniquenessValidator < ActiveModel::Validator
  def validate(record)
    return Reservation.where(date: record.date, ship_id: record.ship_id, location_id: record.location_id).first == nil
  end
end

class LocationCapacityTravelersValidator < ActiveModel::Validator
  def validate(record)
    if(record.ship == nil && record.location == nil)
      return false;
    end
    record.ship.travelers <= record.location.capacity
  end
end

class Reservation
  include Mongoid::Document

  field :date, type: Time
  # slice of the day 1 < slice < 5
  field :slice, type: Integer

  belongs_to :ship
  belongs_to :location

  validates :slice, inclusion: 1..5

  validates :date, :slice, :ship, :location, presence: true

  index([[:date], [:ship], [:location]],
    unique: true
  )

  validates_with ReservationUniquenessValidator 
  validates_with LocationCapacityTravelersValidator
end

