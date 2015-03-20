<%@page import="mapper.Gps"%>

<%
    //Displays one unit older GPS coordinate latitude
    Gps gps = new Gps();
    String coordinates = gps.getCoordinates(true);
    out.print(gps.getLatitude(coordinates));
%>