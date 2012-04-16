class Iaato.Routers.Default extends Backbone.Router
  routes:
    '': 'index'
    'ships': 'ships'

  index: ->
    @navigate 'ships'

  ships: ->
    ships = new Iaato.Collections.Ships()
    view = new Iaato.Views.ApplicationView(type: 'shipList', el: $('body'), collection: ships)
    ships.fetch()
