/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author arthur
 */
public class Gps
{
    //The OpenShift cretentials which the server will get once we deploy
    private final String OPENSHIFT_MYSQL_DB_PORT = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
    private final String OPENSHIFT_MYSQL_DB_HOST = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
    private final String DB_URL = OPENSHIFT_MYSQL_DB_HOST + ":" + OPENSHIFT_MYSQL_DB_PORT;

    /**
     * Insert GPS coordinates from device
     *
     * @param latitude
     * @param longitude
     * @return
     * @throws Exception
     */
    public String setCoordinates(String latitude, String longitude) throws Exception
    {
        String coordinates = "";

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        //Modify here for your MySQl username and password that we noted down earlier
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://" + DB_URL + "/bustrack?",
                "adminwzR7ytp", "4Xc1gVqznxn8");

        String query = "INSERT INTO gps(latitude, longitude) VALUES(?, ?)";

        PreparedStatement sta = conn.prepareStatement(query);

        sta.setString(1, latitude);
        sta.setString(2, longitude);

        sta.executeUpdate();

        conn.close();

        return coordinates;
    }

    /**
     * Retrieve coordinates from database
     * @param isOld Return one set older if true, else return latest newest coordinates
     * @return
     * @throws Exception
     */
    public String getCoordinates(boolean isOld) throws Exception
    {
        String coordinates = "";

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        //Modify here for your MySQl username and password that we noted down earlier
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://" + DB_URL + "/bustrack?",
                "adminwzR7ytp", "4Xc1gVqznxn8");

        String query = "SELECT * FROM gps ORDER BY id DESC LIMIT 1"
                + (isOld ? ", 1" : "");

        PreparedStatement sta = conn.prepareStatement(query);

        ResultSet rs = sta.executeQuery();

        while (rs.next())
        {
            coordinates = String.format("%s, %s",
                    new Object[]
                    {
                        rs.getString("latitude"),
                        rs.getString("longitude")
                    });
        }

        conn.close();

        return coordinates;
    }

    /**
     * Return the latitude part of a set of coordinates
     * @param coordinates
     * @return
     */
    public float getLatitude(String coordinates)
    {
        String[] longitudeArray = coordinates.split(",");

        return Float.parseFloat(longitudeArray[0]);
    }

        /**
     * Return the longitude part of a set of coordinates
     * @param coordinates
     * @return
     */
    public float getLongitude(String coordinates)
    {
        String[] longitudeArray = coordinates.split(",");

        return Float.parseFloat(longitudeArray[1]);
    }
}
