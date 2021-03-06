package mybeans;

import java.sql.*;

public class DBConnector 
{
	private Connection dbconnection;

	public DBConnector()
	{
	   try
	   {
		Class.forName("com.mysql.cj.jdbc.Driver");
		dbconnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/transexample?user=root&password=Pass@123");
	   }
	   catch(Exception e)
	   {
		   System.out.println(e);
	   }
	}

	public Connection getDbconnection()
	{
	  return dbconnection;	
	}

}
