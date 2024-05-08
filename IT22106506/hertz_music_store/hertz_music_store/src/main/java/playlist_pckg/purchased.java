package playlist_pckg;

//child class of allLibrary class
public class purchased extends allLibrary {
	private int userid;
	
	//overloaded constructor
	public purchased(int userid, int song_id, String song_name, String artist_name) {
		super(song_id, song_name, artist_name);
		this.userid = userid;
	}

	public int getUserid() {
		return userid;
	}
	
}
