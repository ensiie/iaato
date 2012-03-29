class Ship
  include Mongoid::Document

  field :name, type: String
  field :travelers, type: Integer
  field :capacity, type: Integer
  field :type, type: String
  field :position, type: Array

  validates :name, uniqueness: true, presence: true
  
end
