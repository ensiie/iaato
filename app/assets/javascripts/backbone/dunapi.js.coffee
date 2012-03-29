#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Dunapi =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$(->
  window.router = new Dunapi.Routers.Default()
  Backbone.history.start({pushState: true})
)
