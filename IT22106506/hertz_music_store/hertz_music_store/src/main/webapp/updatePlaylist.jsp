<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Edit Playlist</title>
		<link href="./css/updatePlaylist.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
	
		<!-- catch values passed from the url parameters -->
		<%
			int plid = Integer.parseInt(request.getParameter("plist_id"));
			String name = request.getParameter("plist_name");
			String desc = request.getParameter("plist_des");
			int usid = Integer.parseInt(request.getParameter("user_id"));
		%>
		
		<h1>Edit Playlist</h1>
		
		<form action="updatePlist" method="post">
			<input type="hidden" name="playlistid" value="<%=plid%>" readonly>
			<input type="hidden" name="userid" value="<%=usid%>" readonly>
			
			<table border="1">	
				<tr>
					<td> <label for="playlist_name">Playlist Name</label> </td>
					<td> <input type="text" name="playlistname" value="<%=name%>"> </td>
				</tr>
				<tr>
					<td> <label for="playlist_description">Playlist Description (Optional) :</label> </td>
					<td> <input type="text" name="description" maxlength="500" value="<%=desc%>"> </td>
				</tr> 
			</table>
			<br>
			<input type="submit" name="submit" value="Update">
		</form>
	</body>
</html>