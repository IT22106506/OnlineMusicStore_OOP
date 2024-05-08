package playlist_pckg;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class playlistDB {
	
	private static boolean isSuccess;  //instance variable to use in any method
	
	//static objects 
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//inserting data into the database
	public static boolean insertPlaylist(String playlist_name, String playlist_description, int user_id) {
		
		//assign the value 'false'
		isSuccess = false;
		
		//run the program without terminating when a run-time error occurs
		try {
			
			con = DBconnect.getConnection();
			
			//create a statement from connection object
			stmt = con.createStatement();
			
			//sql query for inserting data
			String sql = "insert into playlist values (0,'"+playlist_name+"', '"+playlist_description+"', '"+user_id+"')";
			
			//create a ResultSet to execute the sql query
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {  
				//if data entered successfully
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (Exception e){ 
			e.printStackTrace();  //print the error
		}
		
		//return value from insertPlaylist() method
		return isSuccess;
	}
	
	//retrieve data from the database
	public static List<playlist> getPlaylist() {
		
		//create a new ArrayList object from playlist class
		ArrayList<playlist> plist = new ArrayList<>();
		
		//run the program without terminating when a run-time error occurs
		try {
			
			con = DBconnect.getConnection();
			
			//create a statement from connection object
			stmt = con.createStatement();
			
			//sql query to retrieve data from the database
			String sql = "select * from playlist where userid = 1";
			
			//create a ResultSet to execute the sql query
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				//retrieve data using a while loop
				int pid = rs.getInt(1);
				String pname = rs.getString(2);
				String pdes = rs.getString(3);
				int uid = rs.getInt(4);
				
				//assign retrieved data to playlist object
				playlist p = new playlist(pid, pname, pdes, uid);
				
				//pass the playlist object to the ArrayList
				plist.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();   //print the error
		}
		
		//return ArrayList object
		return plist;
	}
	
	//update play list
	public static boolean updatePlaylist(int id, String name, String description, int uid) {
		
		//run the program without terminating when a run-time error occurs
		try {
			
			con = DBconnect.getConnection();
			
			//create a statement from connection object
			stmt = con.createStatement();
			
			//sql query to update the database
			String sql = "update playlist set playlist_name='"+name+"', playlist_description='"+description+"'"
					+ "where playlist_id='"+id+"'";
			
			//create a ResultSet to execute the sql query
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				//if data updated successfully
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();   //print the error
		}
		
		return isSuccess;
	}
	
	//delete play list
	public static boolean deletePlaylist(int id) {
		
		//run the program without terminating when a run-time error occurs
		try {
			
			con = DBconnect.getConnection();
			
			//create a statement from connection object
			stmt = con.createStatement();
			
			//sql query to delete the database
			String sql1 = "delete from playlist_songs where playlist_id='"+id+"'";
			String sql2 = "delete from playlist where playlist_id='"+id+"'";
			
			//create a ResultSet to execute the sql query
			int rs1 = stmt.executeUpdate(sql1);
			
			
			if(rs1 > 0) {
				//if data deleted successfully from the first sql query
				int rs2 = stmt.executeUpdate(sql2);
				
				if(rs2 > 0) {
					//if data deleted successfully
					isSuccess = true;
				}
				
			} else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();   //print the error
		}
		
		return isSuccess;
	}

	//retrieve data from the database
	public static List<purchased> getPurchased() {
		
		//create a new ArrayList object from purchased class
		ArrayList<purchased> purchasedlist = new ArrayList<>();
		
		//run the program without terminating when a run-time error occurs
		try {
				
			con = DBconnect.getConnection();
			
			//create a statement from connection object
			stmt = con.createStatement();
				
			//sql query to retrieve data from the database
			String sql = "select * from purchase_alldetails where userid = 1";
			
			//create a ResultSet to execute the sql query
			rs = stmt.executeQuery(sql);
				
			while(rs.next()) {
				//retrieve data through a while loop
				int uid = rs.getInt(1);
				int sid = rs.getInt(2);
				String sname = rs.getString(3);
				String aname = rs.getString(4);
					
					
				//assign retrieved data to purchased object
				purchased pur = new purchased(uid, sid, sname, aname);
					
				//pass the purchased object to the ArrayList
				purchasedlist.add(pur);
			}
				
		} catch (Exception e) {
			e.printStackTrace();   //print the error
		}
			
		return purchasedlist;
	}
		
	//add song to a playlist
	public static boolean addSong(int playlist_id, int song_id) {
			
		isSuccess = false;
		
		//run the program without terminating when a run-time error occurs
		try {
				
				con = DBconnect.getConnection();
				
				//create a statement from connection object
				stmt = con.createStatement();
				
				//sql query for inserting data
				String sql = "insert into playlist_songs values ('"+playlist_id+"', '"+song_id+"')";
				
				//create a ResultSet to execute the sql query
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) { 
					//if data entered successfully
					isSuccess = true;
				} else {
					isSuccess = false;
				}
				
			} catch (Exception e){
				e.printStackTrace();   //print the error
			}
			
			//return value from insertPlaylist() method
			return isSuccess;
		}
	
	//get one playlist to add songs
	public static List<playlist> getOnePlaylist(int playlist_id) {
		
		//create a new Arraylist object from playlist class
		ArrayList<playlist> plist = new ArrayList<>();
		
		//run the program without terminating when a run-time error occurs
		try {
			
			con = DBconnect.getConnection();
			
			//create a statement from connection object
			stmt = con.createStatement();
			
			//sql query to retrieve data from the database
			String sql = "select * from playlist where playlist_id = '"+playlist_id+"'";
			
			//create a ResultSet to execute the sql query
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				//retrieve data through a while loop
				int pid = rs.getInt(1);
				String pname = rs.getString(2);
				String pdes = rs.getString(3);
				int uid = rs.getInt(4);
				
				//assign retrieved data to playlist object
				playlist p = new playlist(pid, pname, pdes, uid);
				
				//pass the playlist object to the ArrayList
				plist.add(p);
			}
			
		} catch (Exception e) {  
			e.printStackTrace();   //print the error
		}
		
		//return ArrayList object
		return plist;
	}
	
} 
