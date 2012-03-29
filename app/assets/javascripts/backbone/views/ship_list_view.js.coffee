class Iaato.Views.ShipListView extends Backbone.View
  initialize: ->
    @collection.bind 'reset', @render, @

  render: ->
    @collection.each (ship) ->
      $('body').append("<p>#{ship.get('name')}")
