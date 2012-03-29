class Iaato.Models.Ship extends Backbone.Model
  url: -> "/api/ships/#{@id}"
