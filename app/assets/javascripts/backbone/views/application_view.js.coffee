class Iaato.Views.ApplicationView extends Backbone.View
  template: JST['backbone/templates/layout']

  initialize: ->
    @render()
    switch @options.type
      when 'shipList' then new Iaato.Views.ShipListView(el: @$('#content'), collection: @collection)

  render: ->
    $('body').html @template()
