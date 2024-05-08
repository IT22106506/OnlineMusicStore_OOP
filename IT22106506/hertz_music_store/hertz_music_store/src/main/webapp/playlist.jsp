<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Playlist</title>
		<link href="./css/playlist.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
		
		
		<h1>My Playlists</h1>
		
		<!-- click button to activate playlistServlet in web.xml -->
		<form action="redirectToCreate" method="post">
			<input type="submit" value="Create Playlist" class="create">
		</form>
		
		<h2>Playlists</h2>
		
				<!-- loop through items pass from servlet -->
				<c:forEach var="playlist" items="${pdetails}">
				
					<form action="add2Plist" method="post">
						 
						<!-- output playlistid of playlist object as a hidden text -->
						<input type="hidden" name="plistid" value="<c:out value="${playlist.playlistid}"/>">
						
						<!-- set values to variables -->
					 	<c:set var="pid" value="${playlist.playlistid}"/>
					 	<c:set var="pname" value="${playlist.playlistname}"/>
					 	<c:set var="pdes" value="${playlist.playlistdescription}"/>
					 	<c:set var="uid" value="${playlist.userid}"/>
						
						<div class="flex-container-1">
							<!-- output playlistname of playlist object -->
						 	<c:out value="${playlist.playlistname}"/>
						</div>	
						
					    <div class="flex-container-1">
					    	<!-- output playlistdescription of playlist object -->
						    <c:out value="${playlist.playlistdescription}"/>
						</div>
				        
			            <input type="submit" name="add" value="Add songs" class="add">
			            
			            <!-- url to navigate to updatePlaylist.jsp  -->
				        <c:url value="updatePlaylist.jsp" var="plist_update">
				        	<!-- parameters to pass -->
				        	<c:param name="plist_id" value="${pid}"/>
				            <c:param name="plist_name" value="${pname}"/>
				            <c:param name="plist_des" value="${pdes}"/>
				            <c:param name="user_id" value="${uid}"/>
				        </c:url>
				        
				        <!-- pass the variable of url pattern -->	
				        <a href="${plist_update}">
				        	<input type="button" name="update" value="Edit" class="update">
				        </a>
						
						<!-- url to navigate to deletePlaylist.jsp -->	
				        <c:url value="deletePlaylist.jsp" var="plist_delete">
				        	<!-- parameters to pass -->
				        	<c:param name="plist_id" value="${pid}"/>
				            <c:param name="plist_name" value="${pname}"/>
				            <c:param name="plist_des" value="${pdes}"/>    
				            <c:param name="user_id" value="${uid}"/>
				        </c:url>
				        
				        <!-- pass the variable of url pattern -->       	
				        <a href="${plist_delete}">
				        	<input type="button" name="delete" value="Delete" class="delete">
				        </a>
				        
				        
					</form>
		    	
			    </c:forEach>
			  
	</body>
	
</html>


