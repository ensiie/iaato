class Location
  include Mongoid::Document

  field :name, type: String
  field :capacity, type: Integer
  field :coordinates, type: Array

  validates :name, :capacity, :coordinates, presence: true
end
