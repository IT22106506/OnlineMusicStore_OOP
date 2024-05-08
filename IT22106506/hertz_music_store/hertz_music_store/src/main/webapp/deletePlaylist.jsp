<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Delete Playlist</title>
		<link href="./css/deletePlaylist.css" rel="stylesheet" type="text/css">
	</head>

	<body>
	
		<!-- catch values passed from the url parameters -->
		<%
			int plid = Integer.parseInt(request.getParameter("plist_id"));
			String name = request.getParameter("plist_name");
			String desc = request.getParameter("plist_des");
			int usid = Integer.parseInt(request.getParameter("user_id"));
		%>
		
		<h1>Delete Playlist</h1>
		
		<form action="deletePlist" method="post">
			<input type="hidden" name="playlistid" value="<%=plid%>" readonly>
			<input type="hidden" name="userid" value="<%=usid%>" readonly>
			
			<table border="1">	
				<tr>
					<td> <label for="playlist_name">Playlist Name</label> </td>
					<td> <input type="text" name="playlistname" value="<%=name%>" readonly> </td>
				</tr>
				<tr>
					<td> <label for="playlist_description">Playlist Description</label> </td>
					<td> <input type="text" name="description" maxlength="500" value="<%=desc%>" readonly> </td>
				</tr> 
			</table>
			<br>
			<input type="submit" name="submit" value="Delete">
		</form>
	</body>
	
</html>