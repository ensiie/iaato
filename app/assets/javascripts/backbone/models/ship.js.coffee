class Iaato.Models.Ship extends Backbone.Model
  url: -> "/api/ships/#{@id}"

  initialize: ->
    @operator = new Iaato.Models.Operator @get('operator')
    @bind 'change:operator', => @operator.set @get('operator')

    @shipClass = new Iaato.Models.ShipClass @get('ship_class')
    @bind 'change:ship_class', => @shipClass.set @get('ship_class')
