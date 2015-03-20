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

            var map = L.map('map').setView([lat, long], zoomLevel);

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

        </script>
    </body>
</html>