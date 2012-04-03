class Ship
  include Mongoid::Document

  field :name
  field :travelers, type: Integer
  field :capacity, type: Integer
  #field :type
  field :position, type: Array

  validates :name, uniqueness: true, presence: true

  attr_accessible :name, :travelers, :capacity, :position
end
