$(document).ready(function() {
  // Code for 'guide address'
  var address = $('#guide_address').get(0);

  if (address) {
    var autocomplete = new google.maps.places.Autocomplete(address, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }

  // Code for 'steps address'
  var step_address = $('#step_establishment').get(0);

  if (step_address) {
    var autocomplete = new google.maps.places.Autocomplete(step_address, { types: ['establishment'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onStepPlaceChanged);
    google.maps.event.addDomListener(step_address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

function onPlaceChanged() {
console.log("hello")

  var place = this.getPlace();
  var components = getAddressComponents(place);

  $('#address').trigger('blur').val(components.address);
  $('#guide_city').val(components.city);
}
function onStepPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);
  $('#step_establishment').trigger('blur').val(components.name);
  $('#step_address').val(components.formatted_address);
  $('#step_city').val(components.city);
  $('#step_category').val(components.type);
}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()
  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  var formatted_address = null;
  var name = null;
  var type = null;
console.log(place)
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      } else if (type == 'country') {
        country_code = component.short_name;
      }
    }
  }
  formatted_address = place.formatted_address
  name = place.name
  type = place.types[0]

  return {
    address: street_number == null ? route : (street_number + ' ' + route),
    zip_code: zip_code,
    city: city,
    country_code: country_code,
    formatted_address: formatted_address,
    name: name,
    type: type
  };
}
