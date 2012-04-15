collection @reservations
object @location

extends 'api/v1/locations/base'
child @reservations => :reservations do
  extends 'api/v1/reservations/base'
end
