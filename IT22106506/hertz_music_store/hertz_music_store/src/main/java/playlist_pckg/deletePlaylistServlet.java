package playlist_pckg;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletePlaylistServlet")
public class deletePlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Initialize a PrintWriter for sending responses to the client
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		//catch parameters passed from addToPlaylist.jsp
		int plist_id = Integer.parseInt(request.getParameter("playlistid"));
		
		boolean isTrue;
		
		//call deletePlaylist() method in playlistDB.java and pass values
		//assign the return value to isTrue
		isTrue = playlistDB.deletePlaylist(plist_id);
		
		if(isTrue == true) {
			
			//pass values to the next jsp page
			List<playlist> pdetails = playlistDB.getPlaylist();
			//pass attribute name and object name
			request.setAttribute("pdetails", pdetails);
			
			//redirect to playlist.jsp
			RequestDispatcher dis1 = request.getRequestDispatcher("playlist.jsp");
			dis1.forward(request, response);
			
		} else {
			//print the java script to show a pop up error to the user
			out.println("<script type='text/javascript'>");
			out.println("alert('Card add failed');");
			out.println("location='playlist.jsp'");
			out.println("</script>");
		}
	}

}
