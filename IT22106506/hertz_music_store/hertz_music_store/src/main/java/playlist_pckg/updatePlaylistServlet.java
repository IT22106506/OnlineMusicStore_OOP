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

@WebServlet("/updatePlaylistServlet")
public class updatePlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Initialize a PrintWriter for sending responses to the client
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		//catch parameters passed from updatePlaylist.jsp
		int plist_id = Integer.parseInt(request.getParameter("playlistid"));
		String plist_name = request.getParameter("playlistname");
		String plist_des = request.getParameter("description");
		int user_id = Integer.parseInt(request.getParameter("userid"));
		
		boolean isTrue;
		
		//call updatePlaylist() method in playlistDB.java and pass values
		//assign the return value to isTrue
		isTrue = playlistDB.updatePlaylist(plist_id, plist_name, plist_des, user_id);
		
		if(isTrue == true) {
			
			//pass updated data into a List
			List<playlist> pdetails = playlistDB.getPlaylist();
			//pass attribute name and object name
			request.setAttribute("pdetails", pdetails);
			
			//redirect to play list page
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
