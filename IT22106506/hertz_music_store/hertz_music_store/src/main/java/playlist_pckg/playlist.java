package playlist_pckg;

public class playlist {
	private int playlistid;
	private String playlistname;
	private String playlistdescription;
	private int userid;
	
	//overloaded constructor
	public playlist(int playlistid, String playlistname, String playlistdescription, int userid) {
		this.playlistid = playlistid;
		this.playlistname = playlistname;
		this.playlistdescription = playlistdescription;
		this.userid = userid;
	}

	public int getplaylistid() {
		return playlistid;
	}

	public String getplaylistname() {
		return playlistname;
	}

	public String getplaylistdescription() {
		return playlistdescription;
	}

	public int getuserid() {
		return userid;
	}

}
