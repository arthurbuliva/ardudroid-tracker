<%@page import="mapper.Gps"%>

<%
    //Inserts incoming coordinates into the database

    Gps gps = new Gps();

    String latitude = request.getParameter("lat");
    String longitude = request.getParameter("long");
    String id = request.getParameter("id");

    gps.setCoordinates(latitude, longitude);
%>