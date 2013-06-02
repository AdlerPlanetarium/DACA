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
    # Set up Google Map
    mapOptions =
          center: new google.maps.LatLng(location.coords.latitude, location.coords.longitude),
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.ROADMAP
      
    mapCanvas = @el.querySelector '#map-canvas'

    map = new google.maps.Map mapCanvas, mapOptions
    
    # Set up blue current location marker
    myPositionImage =
      url: '//maps.gstatic.com/mapfiles/mobile/mobileimgs2.png'
      size: new google.maps.Size(22, 22)
      origin: new google.maps.Point(0, 18)
      anchor: new google.maps.Point(11, 11)
    
    # Put blue dot on current location
    marker = new google.maps.Marker
      position: new google.maps.LatLng(location.coords.latitude, location.coords.longitude)
      icon: myPositionImage
      map: map
      
    mySiteImage =
      url: 'images/location_marker.svg'
      size: null
      origin: null
      anchor: null
      scaledSize: new google.maps.Size(17, 24)
          
    # Get local library services locations within 2 miles
    locationUrl = "https://data.cityofchicago.org/resource/bmus-hp7e.json?$where=within_circle(location,#{location.coords.latitude},#{location.coords.longitude},3217)&$callback=?"
    
    $.getJSON locationUrl, (data) =>
      alert 'No locations' if data.length == 0
      @plotSitePositions site, map, mySiteImage for site in data
      
      # Redraw map to fit points
      @mapRedraw data, map
        
  plotSitePositions: (site, map, marker) =>
    marker = new google.maps.Marker
      position: new google.maps.LatLng(site.location.latitude, site.location.longitude)
      map: map
      icon: marker
      title: site.organization_name
      
  mapRedraw: (data, map) =>
    lats = []
    lngs = []
    
    for site in data
      lats.push site.location.latitude
      lngs.push site.location.longitude
    
    minLat = Math.min.apply(Math, lats)
    minLng = Math.min.apply(Math, lngs)
    
    maxLat = Math.max.apply(Math, lats)
    maxLng = Math.max.apply(Math, lngs)
    
    southWest = new google.maps.LatLng(minLat, minLng)
    northEast = new google.maps.LatLng(maxLat, maxLng)
    
    bounds = new google.maps.LatLngBounds(southWest, northEast)

    map.fitBounds bounds
    
module.exports = Map