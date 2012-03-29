class Iaato.Routers.Default extends Backbone.Router
  routes:
    'coucou': 'index'

  index: ->
    ships = new Iaato.Collections.Ships()
    ships.fetch()
    new Iaato.Views.ShipListView(collection: ships)
