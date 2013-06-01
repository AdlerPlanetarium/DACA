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
    console.log location

module.exports = Map
