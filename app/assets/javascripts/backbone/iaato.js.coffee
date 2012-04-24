#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
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

if !localStorage
  console.log "Your browser doesn't support LocalStorage"
else
  console.log "Read auth_token : " + localStorage['auth_token']
