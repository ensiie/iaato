class Dunapi.Routers.Default extends Backbone.Router
  routes:
    'coucou': 'index'

  index: ->
    ships = new Dunapi.Collections.Ships()
    ships.fetch()
    new Dunapi.Views.ShipListView(collection: ships)
