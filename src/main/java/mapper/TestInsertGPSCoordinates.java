/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;

/**
 *
 * @author arthur
 */
public class TestInsertGPSCoordinates
{

    public static void main(String[] args) throws Exception
    {
        final Random rnd = new Random();

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test?",
                "arthur", "Lemonade");

        String query = "INSERT INTO gps(latitude, longitude) VALUES(?, ?)";

        PreparedStatement sta = conn.prepareStatement(query);

        for (int i = 0; i < 10000000; i++)
        {
            for (int j = 0; j < 400; j++)
            {
                sta.setString(1, String.valueOf(i / 10.000));
                sta.setString(2, String.valueOf(j / 10.000));

                sta.executeUpdate();
                Thread.sleep(500);
            }

        }

        conn.close();
    }

    /**
     * Generate a decimal string representation of a random number within the
     * supplied bounds.
     *
     * @param random the random object (if null, a new one will be created)
     * @param lowerBound the lower bound, inclusive
     * @param upperBound the upper bound, inclusive
     * @param decimalPlaces the decimal places of the result
     * @return the formatted string
     */
    public static String getRandomValue(final Random random,
            final int lowerBound,
            final int upperBound,
            final int decimalPlaces)
    {

        if (lowerBound < 0 || upperBound <= lowerBound || decimalPlaces < 0)
        {
            throw new IllegalArgumentException("Put error message here");
        }

        final double dbl
                = ((random == null ? new Random() : random).nextDouble() //
                * (upperBound - lowerBound))
                + lowerBound;


        return String.format("%." + decimalPlaces + "f", dbl);

    }
}
