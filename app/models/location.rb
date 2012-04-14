class Location
  include Mongoid::Document

  field :name, type: String
  field :capacity, type: Integer
  field :coordinates, type: Array

  has_many :reservations

  validates :name, :capacity, :coordinates, presence: true
end
