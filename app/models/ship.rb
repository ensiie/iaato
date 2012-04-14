class Ship
  include Mongoid::Document

  field :name
  field :travelers, type: Integer, default: 0
  field :capacity, type: Integer
  #field :type
  field :position, type: Array

  validates :capacity, presence: true
  validates :name, uniqueness: true, presence: true

  has_many :reservations

  attr_accessible :name, :travelers, :capacity, :position
end
