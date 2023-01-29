package com.graphqllambda.util;

import lombok.NonNull;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static final String JDBC_PREFIX = "jdbc:mysql://";

    public Connection createConnection(@NonNull String username,
                                                 @NonNull String databaseName,
                                                 @NonNull String dbEndpoint,
                                                 @NonNull String region,
                                                 String password,
                                                 Integer port) {
        Connection connection;
        try {
            
            DriverManager.registerDriver(new Driver());

            connection = DriverManager.getConnection(
                    JDBC_PREFIX + dbEndpoint, username, password);

            return connection;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}