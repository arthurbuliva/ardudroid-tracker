<%@page import="mapper.Gps"%>

<%
    //Displays latitude and longitude
    Gps gps = new Gps();
    String coordinates = gps.getCoordinates(false);
    out.print(
            String.format("%s, %s",
                    new Object[]
                    {
                        gps.getLatitude(coordinates),
                        gps.getLongitude(coordinates)
                    }));
%>