<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Create Playlist</title>
		<link href="./css/playlist_creation.css" rel="stylesheet" type="text/css">
	</head>

	<body>
		
		<h1>New Playlist </h1>
		<br>
		
		<!-- inserting data  -->
		<form action="insert" method="post" class="playlist-form">
			<fieldset>
				<label for="playlist_name">Playlist Name :</label> 
				<input type="text" name="PlaylistName" maxlength="100" placeholder="My Playlist" required> <br>
				
				<label for="playlist_description">Playlist Description :</label>
				<input type="text" name="Description" maxlength="500" placeholder="(Optional)"> <br>
				
				<br>
				<!-- submit button to send all the data entered -->
				<input type="submit" name="submit" value="Save">
			</fieldset>
		</form> 
	</body>

</html>