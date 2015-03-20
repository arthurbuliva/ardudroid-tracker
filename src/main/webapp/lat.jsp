<%@page import="mapper.Gps"%>

<%
    //Displays latitude
    Gps gps = new Gps();
    String coordinates = gps.getCoordinates(false);
    out.print(gps.getLatitude(coordinates));
%>