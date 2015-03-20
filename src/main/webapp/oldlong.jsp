<%@page import="mapper.Gps"%>

<%
    //Displays one unit older GPS coordinate longitude
    Gps gps = new Gps();
    String coordinates = gps.getCoordinates(true);
   out.print(gps.getLongitude(coordinates));
%>