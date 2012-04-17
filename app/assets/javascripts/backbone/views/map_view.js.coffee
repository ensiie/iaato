class Iaato.Views.MapView extends Backbone.View
  initialize: ->
    @parentView = @options.parentView

    window.mapsCallback = => @render()
    $('body').append('<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_qTivtaJ223K9YrvDiUBvXL08nlrKQCo&sensor=true&callback=mapsCallback"></script>')

  # setup google map on #canvas
  render: ->
    options =
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    @$el.append '<div id="canvas"><div>'
    @map = new google.maps.Map @$('#canvas')[0], options
    console.log 'carte ready'
    console.log @carte
    @parentView.bind 'listupdate', @update, @
    @update()

  update: (collection = @parentView.collection) ->
    # place markers
    _.each @markers, (m) -> m.setMap null
    @markers = new Array()
    collection.each (i) =>
      if i.get('position')
        lat = i.get('position')[0]
        lng = i.get('position')[1]
        latLng =  new google.maps.LatLng(lat, lng)
        @markers.push new google.maps.Marker(position: latLng, map: @map, title: i.get('name'))

    # setCenter
    #@map.setCenter latLng
    if @markers.length > 1
      bounds = new google.maps.LatLngBounds()
      _.each @markers, (m) -> bounds.extend m.getPosition()
      @map.fitBounds bounds
