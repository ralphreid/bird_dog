window.onload = function(){
  var map;
  function initialize_maps(){
    mapOptions = {
      center: new google.maps.LatLng(51.536086,-0.153809),
      zoom: 11
    };
    map = new google.maps.Map(document.getElementById("map-street"),
        mapOptions);
    
  } 

  if($("#map-street"))
    initialize_maps();


  geocoder = new google.maps.Geocoder();
 
  geocoder.geocode( {address: window.street}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      console.log("Geocode was not successful for the following reason: " + status);
    }
  });
  

};