<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.css" />
        <script src="http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    </head>
    <body>
        <div id="map" style="height: 700px;"></div>

        <!--

        This is a test OpenStreetMap implementation of index.jsp
        It is still quite buggy and incomplete but it works to a minimal extent

        -->

        <script type="text/javascript">
            var latitude = "0";
            var longitude = "0";
            var description = "";
            var zoomLevel = 16;

            $.ajax({
                async: false,
                type: 'GET',
                url: 'lat.jsp',
                success: function(data) {
                    latitude = data;
                }
            });

            $.ajax({
                async: false,
                type: 'GET',
                url: 'long.jsp',
                success: function(data) {
                    longitude = data;
                }
            });

            var map = L.map('map').setView([latitude, longitude], zoomLevel);
            var marker = new L.marker([latitude, longitude]).addTo(map);

            //add a marker in the given location, attach some popup content to it and open the popup
            marker.addTo(map)
                    .bindPopup('A pretty CSS3 popup. <br> Easily customizable.')
                    .openPopup();

            /**
             * loadMap
             */
            function loadMap()
            {
                $.ajax({
                    async: false,
                    type: 'GET',
                    url: 'lat.jsp',
                    success: function(data) {
                        latitude = data;
                    }
                });

                $.ajax({
                    async: false,
                    type: 'GET',
                    url: 'long.jsp',
                    success: function(data) {
                        longitude = data;
                    }
                });

                // add an OpenStreetMap tile layer
                L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
                }).addTo(map);

                var position = marker.getLatLng();

                //alert(position);

                marker.setLatLong([-1.2340765, 37.81718]);

                map.setView([latitude, longitude], zoomLevel);
            }

            setInterval("loadMap()", 1000);

        </script>

        <!--
                <script type="text/javascript">
                    var lat = "";
                    var long = "";
                    var description = "";
                    var zoomLevel = 16;

                    $.ajax({
                        async: false,
                        type: 'GET',
                        url: 'lat.jsp',
                        success: function(data) {
                            lat = data;
                        }
                    });

                    $.ajax({
                        async: false,
                        type: 'GET',
                        url: 'long.jsp',
                        success: function(data) {
                            long = data;
                        }
                    });

        //            var map = L.map('map').setView([lat, long], zoomLevel);


                    var map = new
                            OpenLayers.Map("demoMap");
                    map.addLayer(new
                            OpenLayers.Layer.OSM());
                    ourpoint = new OpenLayers.LonLat(
                            lat, long)
                    ourpoint.transform(new
                            OpenLayers.Projection("EPSG:4326"
                                    ), map.getProjectionObject());
                    map.setCenter(ourpoint, 17);
                    map.zoomToMaxExtent();


                    /**
                     * loadMap
                     */
                    function loadMap()
                    {

                        $.ajax({
                            async: false,
                            type: 'GET',
                            url: 'lat.jsp',
                            success: function(data) {
                                lat = data;
                            }
                        });

                        $.ajax({
                            async: false,
                            type: 'GET',
                            url: 'long.jsp',
                            success: function(data) {
                                long = data;
                            }
                        });

                        // add an OpenStreetMap tile layer
                        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
                        }).addTo(map);

                        // add a marker in the given location, attach some popup content to it and open the popup
                        L.marker([lat, long]).addTo(map);
        //                        .bindPopup('A pretty CSS3 popup. <br> Easily customizable.');
                        //                    .openPopup()

                        map.setView([lat, long], zoomLevel);
                    }

                    setInterval("loadMap()", 1000);

                </script>-->
    </body>
</html>