class Iaato.Routers.Default extends Backbone.Router
  authorize: ->
    return localStorage['auth_token'] != undefined

  routes:
    '': 'index'
    'sign_in': 'sign_in'
    'ships': 'ships'

  index: ->
    @navigate 'ships'

  ships: ->
    if @authorize()
      ships = new Iaato.Collections.Ships()
      view = new Iaato.Views.ShipsView(el: $('body'), collection: ships)
      ships.fetch()
    else
      @navigate 'sign_in'

  sign_in: ->
    view = new Iaato.Views.SignInView(el: $('body'))

