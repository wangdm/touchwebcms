package com.lubocluod.touchwebcms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataConnection {
	private static DataConnection connection = null;
	private Connection conn = null;  
    private static final String DRIVER = "com.mysql.jdbc.Driver";  
    private static final String USER = "root";  
    private static final String URL = "jdbc:mysql://localhost:3306/touchwebcms";
    private static final String PASS = "";  
	
	private DataConnection() throws SQLException, ClassNotFoundException{
        Class.forName(DRIVER);  
        conn = DriverManager.getConnection(URL,USER,PASS);  
	}
	
	protected void finalize() throws Throwable
    {
      super.finalize();
      conn.close();
    }
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		if(connection==null)
		{
			connection = new DataConnection();
		}
		return connection.conn;
	}
}
