attributes :id, :name, :travelers, :capacity, :position
child operator: :operator do
  extends 'api/v1/operators/base'
end
child ship_class: :ship_class do
  extends 'api/v1/ship_classes/base'
end
