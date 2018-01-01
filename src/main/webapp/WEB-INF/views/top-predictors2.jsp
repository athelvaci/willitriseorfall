<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- provides enhanced mechanism in jsp. -->
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- dont forget to add to another files -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<jsp:include page="../views/fragments/header2.jsp"></jsp:include>
</head>
<!--/head-->
<body>
	<header class="navbar navbar-inverse navbar-fixed-top wet-asphalt"
		role="banner">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index"><img
				src="resources/images/logo.png" alt="logo"></a>
		</div>
		<div class="collapse navbar-collapse">
		<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index">Home</a></li>
				<li><a href="predict-now">Predict Now</a></li>
				<li class="active"><a href="top-predictors">Top
						Predictors</a></li>
				<li><a href="discuss">Discuss</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="about-me">About Me</a></li>
						<li><a href="prediction-history">Prediction History</a></li>
						<li><a href="following">Following Users</a></li>
						<c:if test="${islogin}"><li><a href="#" onclick="document.forms['logoutForm'].submit()">Logout</a></li></c:if>
						<li class="divider"></li>
						<li><a href="privacy">Privacy Policy</a></li>
					
						<li><a href="contact-us">Contact Us</a></li>
					</ul></li>
					<c:if test="${islogin}"> <li><a href="about-me">Welcome ${username}</a></li> </c:if>
					<c:if test="${!islogin}">
					<li><a href="login">Log in</a></li>
				<li><a href="signup">Sign up</a></li>
					</c:if>
				
			</ul>
		</div>
	</div>
	</header>
	<!--/header-->


	<section id="title" class="emerald">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h1>Top Predictors</h1>
				<p>Here is the best predictors of all times</p>
			</div>
			<div class="col-sm-6">
				<ul class="breadcrumb pull-right">
					<li><a href="index">Home</a></li>
					<li class="active">Top Predictors</li>
				</ul>
			</div>
		</div>
	</div>
	</section>
	<!--/#title-->


	<section class="container"><!--/#table-->
	<div class="center">
		<h2>Best predictors of all times</h2>

	</div>
	<!--/.center-->



	<table id="grid-basic"
		class="table table-condensed table-hover table-striped">
		<thead>
			<tr>
				<th data-column-id="place" data-type="numeric" data-order="asc">Place</th>
				<th data-column-id="predictorname" data-formatter="link" data-sortable="false">Predictor
					Name</th>
				<th data-column-id="score" data-type="numeric">Score</th>
				<th data-column-id="accuracy" data-type="numeric">Accuracy</th>
			</tr>
		</thead>


		<tfoot>
			<tr>
				<th>Place</th>
				<th>Predictor Name</th>
				<th>Score</th>
				<th>Accuracy</th>
			</tr>
		</tfoot>

		<tbody>
			<c:forEach items="${topPredictorsList}" var="predictor"
				varStatus="status">
				<tr>

					<td>${status.count}</td>
					<td><a href="#">${predictor.predictorName}</a></td>
					<td>${predictor.predictorScore}</td>
					<td>${predictor.predictorAccuracy}</td>

				</tr>

			</c:forEach>
		<tbody>
	</table>
	</br>
	</br>
	</br>


	</section>


	<jsp:include page="../views/fragments/footer2.jsp"></jsp:include>
</body>
</html>