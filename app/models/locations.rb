class Location
  include Mongoid::Document

  field :name
  field :coordinates, type: Array
end
