class Location
  include Mongoid::Document

  field :name, type: String
  field :capacity, type: Integer
  field :coordinates, type: Array
  field :zone, type: String
  field :geo, type: String
  # True : open, False : close
  field :open, type: Boolean

  validates :name, :coordinates, presence: true
end
