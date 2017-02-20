$( document ).ready(function(){
     $(".button-collapse").sideNav();
});



// handle Google Maps stuff
function initialize() {
    var mapCanvas = document.getElementById('map');
    var mapOptions = {
        center: new google.maps.LatLng(48.12, 11.60),
        zoom: 15,
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
    var styledMap = new google.maps.StyledMapType(styles,
        {name: "Styled Map"});
    map.mapTypes.set('map_style', styledMap);
    map.setMapTypeId('map_style');

    var marker = new google.maps.Marker({
        position: {lat: 48.1238228, lng: 11.6059726},
        map: map
    });
}

google.maps.event.addDomListener(window, 'load', initialize);
