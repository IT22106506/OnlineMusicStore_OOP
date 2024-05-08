package playlist_pckg;

//parent class
public class allLibrary {
	protected int song_id;
	protected String song_name;
	protected String artist_name;

	//overloaded constructor
	public allLibrary(int song_id, String song_name, String artist_name) {
		this.song_id = song_id;
		this.song_name = song_name;
		this.artist_name = artist_name;
	}

	public int getsong_id() {
		return song_id;
	}

	public String getsong_name() {
		return song_name;
	}

	public String getartist_name() {
		return artist_name;
	}

	@Override
	public String toString() {
		return "Library [id=" + song_id + ", name=" + song_name + ", artist_name=" + artist_name  + "]";
	}



}

