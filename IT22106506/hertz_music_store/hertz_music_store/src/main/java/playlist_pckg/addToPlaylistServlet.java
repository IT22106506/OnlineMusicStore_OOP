package playlist_pckg;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addToPlaylistServlet")
public class addToPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//catch parameters passed from addToPlaylist.jsp
		int playlist_id = Integer.parseInt(request.getParameter("plistid"));
		
		//pass values to the next jsp page
		List<playlist> oneplist = playlistDB.getOnePlaylist(playlist_id);
		//pass attribute name and object name
		request.setAttribute("oneplist", oneplist);
		
		//pass values to the next jsp page
		List<purchased> purdetails = playlistDB.getPurchased();
		//pass attribute name and object name
		request.setAttribute("purdetails", purdetails);
		
		//redirect to addToPlaylist.jsp
		RequestDispatcher dis1 = request.getRequestDispatcher("addToPlaylist.jsp");
		dis1.forward(request, response);
		
	}

}
