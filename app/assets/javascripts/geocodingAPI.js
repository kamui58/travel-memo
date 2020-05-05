// // const latlngDis = document.getElementById('latlngDisplay')


function initMap() {

}



function codeAddress() {
  geocoder = new google.maps.Geocoder();
  inputAddress = document.getElementById('inputAddress').value;
  const addressDis = document.getElementById('resultsAddress');
  let formElements = document.forms[0];
  



  geocoder.geocode({ 'address': inputAddress }, function (results, status) {
    if (status == 'OK') {

      resultsAddress = results[0].formatted_address.replace(/日本、〒[/\d/]{3,}-[/\d/]{4,}/g, "");

      addressDis.innerHTML = resultsAddress;

      resultsPref = results[0].address_components.forEach(function (value) {
        type = value.types[0]
        if (type == "administrative_area_level_1") {
          formElements.prefecture.value = value.long_name;
        }
      });

      resultsMuni = results[0].address_components.forEach(function (value) {
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
