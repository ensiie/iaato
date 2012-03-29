#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Iaato =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$(->
  window.router = new Iaato.Routers.Default()
  Backbone.history.start({pushState: true})
)
