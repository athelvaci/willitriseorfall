<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> <!-- dont forget to add to another files -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="<spring:url value="/resources/css/home.css"/>" type="text/css"/>
</head>
<body>
	<h1>Homie</h1>
	<div class="container">
		
		<h2>Current Project</h2>
		<ul class="list-group">
  			<li class="list-group-item"><label>Project Name:</label><span>${currentProject.name }</span></li>
  			<li class="list-group-item"><label>Sponsor:</label><span>${currentProject.sponsor }</span></li>
  			<li class="list-group-item"><label>Description:</label><br/><span>${currentProject.description }</span></li>
		</ul>
		
	</div>
</body>
</html>