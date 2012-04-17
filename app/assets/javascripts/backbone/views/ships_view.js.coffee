class Iaato.Views.ShipsView extends Backbone.View
  template:
    layout: JST['backbone/templates/layout']
    ship_list_item: JST['backbone/templates/ship_list_item']

  events:
    'change #filter form': 'filterChange'
    'keyup #filter form': 'filterChange'
    'submit #filter form': 'filterAbordSubmition'

  initialize: ->
    @name = 'ships'
    @renderLayout()
    new Iaato.Views.NavView(el: @$('nav.menu'))
    new Iaato.Views.MapView(el: @$('#map'), parentView: @)
    @collection.bind 'reset', @renderShips, @

  filterChange: (e) ->
    $form = @$('#filter form')
    getFormValue = (name) -> @$("input[name='#{name}']", $form).val()

    # attributes
    name = getFormValue('name')

    # apply filter
    @renderShips(new Iaato.Collections.Ships(@collection.filter (s) -> s.get('name').match new RegExp("^#{name}", 'i')))

  filterAbordSubmition: (e) -> e.preventDefault(); @filterChange()

  renderLayout: ->
    @$el.html @template.layout @

  renderShips: (filtredCollection = @collection) ->
    @$('ul.ships').html ''
    filtredCollection.each (ship) => @$('ul.ships').append(@template.ship_list_item ship)
    @trigger 'listupdate', filtredCollection

