class Iaato.Views.NavView extends Backbone.View
  template: JST['backbone/templates/nav']

  initialize: ->
    @render()

  render: ->
    @$el.html @template @
