function emailReplace (){
    var m = "orgateam" + String.fromCharCode(64) + "nixcon2017.org";
    document.getElementById("contactEmail").innerHTML = m;
    document.getElementById("contactEmail").href = "mailto:" + m;
}

$( document ).ready(function(){
    $(".button-collapse").sideNav();
    emailReplace();
});



// handle Google Maps stuff
function initialize() {
    var mapCanvas = document.getElementById('map');
    var mapOptions = {
        center: new google.maps.LatLng(48.19, 11.6472),
        zoom: 12,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(mapCanvas, mapOptions);

    var styles = [
        {
            stylers: [
                { hue: "#2196f3" },
                { saturation: -50 }
            ]
        },{
            featureType: "road",
            elementType: "geometry",
            stylers: [
                { lightness: 100 },
                { visibility: "simplified" }
            ]
        }
    ];

    var marker = new google.maps.Marker({
        position: {lat: 48.1861991, lng: 11.6547822},
        map: map
    });
}

google.maps.event.addDomListener(window, 'load', initialize);
