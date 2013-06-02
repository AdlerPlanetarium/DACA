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
          zoom: 12,
          mapTypeId: google.maps.MapTypeId.ROADMAP

    mapCanvas = @el.querySelector '#map-canvas'
    map = new google.maps.Map mapCanvas, mapOptions
    
module.exports = Map
