package playlist_pckg;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/indexServlet")
public class indexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//call getPlaylist() method in playlistDB.java and save it into a list of playlist class
		List<playlist> pdetails = playlistDB.getPlaylist();
		//pass attribute name and object name
		request.setAttribute("pdetails", pdetails);
		
		//redirect to playlist.jsp
		RequestDispatcher dis1 = request.getRequestDispatcher("playlist.jsp");
		dis1.forward(request, response);

	}

}
