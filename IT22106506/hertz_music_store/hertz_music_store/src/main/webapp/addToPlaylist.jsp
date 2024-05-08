<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Add Songs to Playlist</title>
		<link href="./css/addToPlaylist.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
	
		<h1>Add Songs to Playlist</h1>
		
		<!-- loop through items passed from servlet -->
		<c:forEach var="oneplaylist" items="${oneplist}">
		
			<!-- loop through items passed from servlet -->
			<c:forEach var="purchdetails" items="${purdetails}">
			
				<form action="add" method="post">
			
					<input type="hidden" name="onepid" value="${oneplaylist.playlistid}">
			
		    		<input type="hidden" name="songid" value="${purchdetails.song_id}">
		         
			            <div class="form-row"> 
			            	<!-- output song_name of purchdetails object -->   
			   				<c:out value="${purchdetails.song_name}" />
			   			</div>
			            
			            <div class="form-row">  
				            <!-- output artist_name of purchdetails object -->   	
				            <c:out value="${purchdetails.artist_name}" />
			            </div> 
			            
			            <div class="form-row">
			            	<input type="submit" name="addlist" value="Add to Playlist">
			            </div>
			                          
				</form>
		
			</c:forEach>
			
					<!-- url to navigate to fullPlaylist.jsp  -->
		            <c:url value="fullPlaylist.jsp" var="full_plist">
		            	<!-- parameters to pass -->
		                <c:param name="plist_id" value="${pid}"/>
		                <c:param name="plist_name" value="${pname}"/>
		                <c:param name="plist_des" value="${pdes}"/>
		                <c:param name="user_id" value="${uid}"/>
		            </c:url>
		            
		            <!-- pass the variable of url pattern -->
		            <form action="backtoplaylist" method="post">
		            	<input type="submit" name="back" value="Back">
		            </form>
		            
		
		</c:forEach>
		
	</body>
	
</html>