class Iaato.Views.ShipListView extends Backbone.View
  template: JST['backbone/templates/ship_list']

  initialize: ->
    @collection.bind 'reset', @render, @

  render: ->
    @$el.html @template @
