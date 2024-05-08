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

@WebServlet("/createServelet")
public class createServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//initialize a PrintWriter for sending responses to the client
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		//catch data from the playlist_cretation.jsp page 
		String playlist_name = request.getParameter("PlaylistName");
		String playlist_description = request.getParameter("Description");
		
		boolean isTrue;
		
		//call insertPlaylist() model in the playlistDB
		//pass inserted data and get the return value from insertPlaylist()
		isTrue = playlistDB.insertPlaylist(playlist_name, playlist_description, 1);
		
		if(isTrue == true) {  //if inserted successfully
			
			//read newly inserted data and display them in the play list page
			List<playlist> pdetails = playlistDB.getPlaylist();
			request.setAttribute("pdetails", pdetails);
			
			//redirect to play list page
			RequestDispatcher dis1 = request.getRequestDispatcher("playlist.jsp");
			dis1.forward(request, response);
			
		} else {  //if not successfully inserted
			//print the java script to show a pop up error to the user
			out.println("<script type='text/javascript'>");
			out.println("alert('Card add failed');");
			out.println("location='playlist.jsp'");
			out.println("</script>");
		}
	}

}
