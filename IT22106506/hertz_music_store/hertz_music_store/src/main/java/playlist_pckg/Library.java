package playlist_pckg;

//child class of allLibrary class
public class Library extends allLibrary {
	private double price;
	private String images;
	
	//overloaded constructor
	public Library(int song_id, String song_name, String artist_name, double price2, String image) {
		super(song_id, song_name, artist_name);
		this.price = price2;
		this.images = image;
	}
	
	public double getprice() {
		return price;
	}

	public String getimages() {
		return images;
	}

	@Override
	public String toString() {
		return "Library [price=" + price + ", image=" + images + "]";
	}



}
