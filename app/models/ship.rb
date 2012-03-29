class Ship
  include Mongoid::Document

  field :name, type: String
  field :travelers, type: Integer
  field :capacity, type: Integer

  validates :name, uniqueness: true, presence: true
  
end
