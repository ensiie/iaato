class Iaato.Views.ShipsView extends Backbone.View
  template:
    layout: JST['backbone/templates/ships/layout']
    filter: JST['backbone/templates/ships/ships_filter']
    shipListItem: JST['backbone/templates/ships/ship_list_item']
    operatorFilterOption: (context) -> (-> "<option value='#{@id}'>#{@get 'name'}</option>").apply(context)
    shipClassFilterOption: (context) -> (-> "<option value='#{@id}'>#{@get 'name'}</option>").apply(context)

  events:
    'change form': 'filterChange'
    'keyup form': 'filterChange'
    'submit form': 'filterAbordSubmition'

  initialize: ->
    @renderLayout()
    @renderFilter()
    new Iaato.Views.NavView(el: @$('nav.menu'))
    new Iaato.Views.MapView(el: @$('#map'), parentView: @)
    @collection.bind 'reset', @renderShips, @

  filterChange: (e) ->
    $form = @$('form')
    getFormValue = (name) -> @$("[name='#{name}']", $form).val()

    # attributes
    name = getFormValue 'name'
    operatorId = getFormValue 'operator'
    classId = getFormValue 'class'

    console.log "classId: #{classId}"

    # apply filter
    @renderShips(new Iaato.Collections.Ships(@collection.filter (s) ->
      (if name then s.get('name').match(new RegExp("^#{name}", 'i')) else true) &&
      (if operatorId then s.operator.id is operatorId else true) &&
      (if classId then s.shipClass.id is classId else true)
    ))

  filterAbordSubmition: (e) -> e.preventDefault(); @filterChange()

  renderLayout: ->
    @$el.html @template.layout @

  renderFilter: ->
    @$('#map').after @template.filter @
    filterEl = @$('form')
    operators = new Iaato.Collections.Operators()
    operators.bind 'reset', =>
      operators.each (o) => $('select[name="operator"]', filterEl).append(@template.operatorFilterOption o)
    shipClasses = new Iaato.Collections.ShipClasses()
    shipClasses.bind 'reset', =>
      shipClasses.each (sc) => $('select[name="class"]', filterEl).append(@template.shipClassFilterOption sc)
    operators.fetch()
    shipClasses.fetch()

  renderShips: (filtredCollection = @collection) ->
    @$('ul.ships').html ''
    filtredCollection.each (ship) => @$('ul.ships').append(@template.shipListItem ship)
    @trigger 'listupdate', filtredCollection

