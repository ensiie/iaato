collection @reservations
object @ship

extends 'api/v1/ships/base'
child @reservations => :reservations do
  extends 'api/v1/reservations/base'
end
