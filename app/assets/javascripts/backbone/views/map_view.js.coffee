class Iaato.Views.MapView extends Backbone.View
  initialize: ->
    @parentView = @options.parentView
    @parentView.bind 'update', @update, @

    window.mapsCallback = => @render()
    $('body').append('<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_qTivtaJ223K9YrvDiUBvXL08nlrKQCo&sensor=true&callback=mapsCallback"></script>')

  # setup google map on #canvas
  render: ->
    options =
      zoom: 8,
      center: new google.maps.LatLng(-34.397, 150.644),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    @$el.append '<div id="canvas"><div>'
    @map = new google.maps.Map @$('#canvas')[0], options
