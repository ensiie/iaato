class Iaato.Views.SignInView extends Backbone.View
  template:
    layout: JST['backbone/templates/sign_in']

  initialize: ->
    @username = localStorage['username'] or "username"
    @renderLayout()

  renderLayout: ->
    @$el.html @template.layout @

  events:
    "submit form" : "prevent_submit"
    "click button" : "login"

  prevent_submit: (e) ->
    e.prevent_default()
    false

  login: ->
    $.ajaxSetup ->
      beforeSend: (jqXHR) ->
        token = $('meta[name="csrf-token"]').attr('content')
        if(token)
          jqXHR.setRequestHeader('X-CSRF-Token', token)

    $.ajax '/users/sign_in'
      type: 'POST'
      dataType: 'json'
      data: {email: $('#login_form').username.value, password: $('#login_form').password.value}
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        @navigate 'ships'
  

