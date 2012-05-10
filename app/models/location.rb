class Location
  include Mongoid::Document

  field :name, type: String
  field :capacity, type: Integer
  field :coordinates, type: Array
  field :zone, type: String
  field :geo, type: String

  validates :name, :coordinates, presence: true
end
