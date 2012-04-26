class Iaato.Views.SignInView extends Backbone.View
  template:
    layout: JST['backbone/templates/sign_in']

  initialize: ->
    @username = localStorage['username'] or "username"
    @renderLayout()

  renderLayout: ->
    @$el.html @template.layout @

  events:
    "submit form#login_form" : "login"
    "click button#logout_button" : "logout"

  logout: ->
    localStorage.removeItem('auth_token')
    $.ajax '/users/sign_out'
      type: 'DELETE'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        if textStatus = 302
          $('#login_error').html("Logout successful")
        else
          $('#login_error').html("Logout failed")

  login: (e) ->
    e.preventDefault()
    $.ajaxSetup ->
      beforeSend: (jqXHR) ->
        token = $('meta[name="csrf-token"]').attr('content')
        if(token)
          jqXHR.setRequestHeader('X-CSRF-Token', token)

    $.ajax '/users/sign_in'
      type: 'POST'
      dataType: 'json'
      data: { 'user[email]': $('#username').val(), 'user[password]': $('#password').val()}
      error: (jqXHR, textStatus, errorThrown) ->
        $('#login_error').html("Login failed")
      success: (data, textStatus, jqXHR) ->
        if data.response == "ok"
          localStorage['auth_token'] = data.auth_token
          $('#login_error').html("")
          window.router.navigate("/ships", {trigger: true})
        else
          $('#login_error').html("Login failed")
