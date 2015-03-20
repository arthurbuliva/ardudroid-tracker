<%@page import="mapper.Gps"%>

<%
    //Displays longitude
    Gps gps = new Gps();
    String coordinates = gps.getCoordinates(false);
   out.print(gps.getLongitude(coordinates));
%>