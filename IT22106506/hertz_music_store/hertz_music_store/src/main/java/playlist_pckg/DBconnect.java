package playlist_pckg;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	
	//declare variables and assign values
	private static String url = "jdbc:mysql://localhost:3306/hertz_music_store";
	private static String username = "root";
	private static String password = "sandithi16";
	
	//variable object to save the connection
	private static Connection con;
	
	//method to create the Connection
	public static Connection getConnection() {
		
		//run the program without terminating when a run-time error occurs
		try {
			//driver to create the database connection
			Class.forName("com.mysql.jdbc.Driver");
			
			//pass variables to getConnection() method
			con = DriverManager.getConnection(url, username, password);
			
		} catch (Exception e) {
			System.out.println("!!!Database Connection is Unsuccessful!!!");
		}
		
		return con;
		
	}

}
