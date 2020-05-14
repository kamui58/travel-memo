  function initMap() {

  }
function codeAddress() {
  geocoder = new google.maps.Geocoder();
  inputAddress = document.getElementById('inputAddress').value;
  const addressDis = document.getElementById('resultsAddress');
  let formElements = document.forms.postForm;

  geocoder.geocode({ 'address': inputAddress }, function (results, status) {
    if (status == 'OK') {

      if (map != true) {
        map = new google.maps.Map(document.getElementById('map'), {
          center: results[0].geometry.location,
          zoom: 9,
          mapTypeControl: false,
          streetViewControl: false,
          draggable: false,
          fullscreenControl: false,
        });
        marker = new google.maps.Marker({
          position: map.getCenter(),
          map: map,
        });
      } else {
        marker.setMap(null);
        map.setCenter(results[0].geometry.location);
        marker = new google.maps.Marker({
          position: results[0].geometru.location,
          map: map,
        })
      }

      resultsAddress = results[0].formatted_address.replace(/日本、〒[/\d/]{3,}-[/\d/]{4,}/g, "");
      addressDis.innerHTML = resultsAddress;

      results[0].address_components.forEach(function (value) {
        type = value.types[0]
        if (type == "administrative_area_level_1") {
          formElements.prefecture.value = value.long_name;
        }
      });

      results[0].address_components.forEach(function (value) {
        type = value.types[0]
        if (type == "locality") {
          formElements.municipality.value = value.long_name;
        }
      })
    } else {
      alert("該当する結果がありませんでした：" + status);
    }
  });
}
