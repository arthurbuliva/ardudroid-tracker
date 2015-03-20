<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <style type="text/css">
            html { height: 100% }
            body { height: 100%; margin: 0; padding: 0 }
            #map-canvas { height: 100% }
        </style>

        <!--        In the part labelled XXX in the source URL below, get your
                Google Maps API key and replace the XXX with your key.

                Instructions on how to get a key are documented on Google at
                https://developers.google.com/maps/documentation/javascript/tutorial#api_key

                key=AIzaSyD3_fnKG8anTAaAHJzYHggsYqMYBfmjgT4

                <script type="text/javascript"
                src="https://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize">
        </script>
        -->

        <script src="https://maps.googleapis.com/maps/api/js?v=3.12&sensor=false" type="text/javascript"></script>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    </head>
    <body>
        <div id="map-canvas"></div>
        <script type="text/javascript">

                    var latitude = 0;
                    var longitude = 0;

                    var latLong = "0,0";
                    var map;
                    var polyLine;
                    var mapScale = 17;
                    var lineCoordinates;

                    var mapOptions =
                            {
                                center: new google.maps.LatLng(latitude, longitude),
                                zoom: mapScale,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            };

                    map = new google.maps.Map(document.getElementById('map-canvas'),
                            mapOptions);

                    var lineSymbol = {
                        path: google.maps.SymbolPath.CIRCLE,
                        scale: 6,
                        strokeColor: '#FF0000',
                        fillColor: '#FF0000',
                        fillOpacity: 1,
                    };

                    lineCoordinates = [
                        new google.maps.LatLng(latitude, longitude),
                        new google.maps.LatLng(latitude, longitude),
                    ];

                    polyLine = new google.maps.Polyline({
                        path: lineCoordinates,
                        icons: [{
                                icon: lineSymbol,
                                offset: '100%'
                            }],
                        strokeOpacity: 0,
                        map: map
                    });


                    function initialize()
                    {
                        setInterval(refreshMap, 1500);
                    }

                    /**
                     * d
                     */
                    function refreshMap()
                    {
                         $.ajax({
                            async: false,
                            type: 'GET',
                            url: 'latlong.jsp',
                            success: function(data) {
                                latLong = data;
                            }
                        });

                        var latlongSplit = latLong.split(",");

                        lineCoordinates = [
                            new google.maps.LatLng(latlongSplit[0], latlongSplit[1]),
                            new google.maps.LatLng(latlongSplit[0], latlongSplit[1]),
                        ];

                        polyLine.setPath(lineCoordinates);

                        map.setCenter(new google.maps.LatLng(latlongSplit[0], latlongSplit[1]));

                    }

                    google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </body>
</html>