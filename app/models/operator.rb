class Operator
  include Mongoid::Document

  field :name

  has_many :ships
end
