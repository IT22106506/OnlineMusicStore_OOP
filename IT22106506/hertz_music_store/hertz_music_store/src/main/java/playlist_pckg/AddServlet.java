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

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//initialize a PrintWriter for sending responses to the client
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		//catch parameters passed from addToPlaylist.jsp
		int playlist_id = Integer.parseInt(request.getParameter("onepid"));
		int song_id = Integer.parseInt(request.getParameter("songid"));
		
		boolean isTrue;
		
		//call addSong() method in playlistDB.java and pass values
		//assign the return value to isTrue
		isTrue = playlistDB.addSong(playlist_id, song_id);
		
		if(isTrue == true) {
			
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
			
		} else {
			//print the java script to show a pop up error to the user
			out.println("<script type='text/javascript'>");
			out.println("alert('Card add failed');");
			out.println("location='addToPlaylist.jsp'");
			out.println("</script>");
		}
	}

}
