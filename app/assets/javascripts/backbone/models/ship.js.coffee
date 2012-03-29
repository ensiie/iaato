class Dunapi.Models.Ship extends Backbone.Model
  url: -> "/api/ships/#{@id}"
