package com.graphqllambda.util;

import java.sql.Connection;
import java.sql.SQLException;


public class InitDB {

    private Connection connection;

    public InitDB() {

        try {

            String databaseName = System.getenv("DATABASE_NAME");
            String endpoint = System.getenv("END_POINT");
            String dbUserName = System.getenv("DB_USER_NAME");
            String region = System.getenv("REGION");
            String password = System.getenv("DB_PASS");
            int port = Integer.parseInt(System.getenv("DB_PORT"));
            
            DBUtil dbUtil = new DBUtil();

            this.connection = dbUtil.createConnection(dbUserName, databaseName, endpoint, region, password, port);


            connection.setCatalog(databaseName);

        } catch (SQLException e) {
            throw new RuntimeException("Error initializing the DB", e);
        }
    }

    public Connection getConnection() {
        return this.connection;
    }

}