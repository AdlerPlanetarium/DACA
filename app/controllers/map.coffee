Page = require './page'
template = require '../views/map'

class Map extends Page
  template: template
  
  constructor: -> 
    super
   
    mapLink = @el.querySelector '#map-find'
    mapLink.addEventListener 'click', @plotSite, false
    
  plotSite: =>
    navigator.geolocation.getCurrentPosition @logLocation
  
  logLocation: (location) =>
    @setupMap location
    
  setupMap: (location) =>
    console.log location
    mapOptions =
          center: new google.maps.LatLng(location.coords.latitude, location.coords.longitude),
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.ROADMAP

    mapCanvas = @el.querySelector '#map-canvas'

    map = new google.maps.Map mapCanvas, mapOptions
    
    locationImage =
      url: '//maps.gstatic.com/mapfiles/mobile/mobileimgs2.png'
      size: new google.maps.Size(22, 22)
      origin: new google.maps.Point(0, 18)
      anchor: new google.maps.Point(11, 11)
    
    marker = new google.maps.Marker
      position: new google.maps.LatLng(location.coords.latitude, location.coords.longitude)
      icon: locationImage
      map: map
    
module.exports = Map
