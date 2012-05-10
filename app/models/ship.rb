class Ship
  include Mongoid::Document

  field :name
  field :travelers, type: Integer, default: 0
  field :capacity, type: Integer
  field :position, type: Array
  field :email, type: String
  field :phone, type: String
  field :call_sign, type: String

  belongs_to :operator
  belongs_to :ship_class

  validates :name, uniqueness: true, presence: true

  attr_accessible :name, :travelers, :capacity, :position, :email, :phone
end
