package playlist_pckg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/playlistServlet")
public class playlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//redirect to playlist_creation.jsp
		RequestDispatcher dis1 = request.getRequestDispatcher("playlist_creation.jsp");
		dis1.forward(request, response);
		
	}

}
