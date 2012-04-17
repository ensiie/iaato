class Iaato.Views.ApplicationView extends Backbone.View
  template_layout: JST['backbone/templates/layout']

  initialize: (name) ->
    @name = name
    @render()

  render: ->
    $('body').html @template_layout @
