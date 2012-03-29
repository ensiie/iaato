class ReservationUniquenessValidator < ActiveModel::Validator
  def validate(record)
    return Reservation.where(date: record.date, ship_id: record.ship_id, location_id: record.location_id).first == nil
  end
end

class LocationCapacityTravelersValidator < ActiveModel::Validator
  def validate(record)
    if(record.ship == nil or record.location == nil)
      return false;
    end
    record.ship.travelers <= record.location.capacity
  end
end

class AntiDuplicationValidator < ActiveModel::Validator
  def validate(record)
    if(record.ship = nil or record.location == nil)
      return false
    end

    Reservation.where(ship: record.ship).to_a.each do |s|
      if record.date.beginning_of_day == s.date.beginning_of_day
        and record.slice == s.slice then
        return false
      end
    end
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
  validates_with AntiDuplicationValidator
end

