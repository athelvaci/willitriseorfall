<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>  

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- dont forget to add to another files -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../views/fragments/header.jsp"></jsp:include>
</head>
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
				src="resources/images/logo.png"></a>
		</div>
		<div class="collapse navbar-collapse">
		<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		
			<ul class="nav navbar-nav navbar-right">
				<li ><a href="index">Home</a></li>
				<li><a href="predict-now">Predict Now</a></li>
				<li><a href="top-predictors">Top Predictors</a></li>
				<li><a href="dashboard">Dashboard</a></li>
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
				<h1>Contact Us</h1>
				<p>Please contact us for any question or request.</p>
			</div>
			<div class="col-sm-6">
				<ul class="breadcrumb pull-right">
					<li><a href="index">Home</a></li>
					<li class="active">Contact Us</li>
				</ul>
			</div>
		</div>
	</div>
	</section>
	<!--/#title-->

	<section id="contact-page" class="container">
	<div class="row">
		<div class="col-sm-8">
			<h4>Contact Form</h4>
			<div class="status alert alert-success" style="display: none"></div>

			<form id="main-contact-form" class="contact-form" method="post"
				action=" <spring:url value="/contact-us?${_csrf.parameterName}=${_csrf.token}"></spring:url>">
				<div class="row">
					<div class="col-sm-5">
						<div class="form-group">
							<input type="text" class="form-control" required="required"
								name="firstName" placeholder="First Name"></input>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" required="required"
								name="lastName" placeholder="Last Name"></input>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" required="required"
								name="emailAddress" placeholder="Email address"></input>
						</div>
						

							<button type="submit" class="btn btn-primary btn-lg"
								value="contact-form" onclick="showDiv()" >Send Message</button>

						
					</div>
					<div class="col-sm-7">
						<textarea  id="message" required="required"
							class="form-control" rows="8" name="messageOfUser"
							placeholder="Message"></textarea>
					</div>
				</div>
			</form>
		</div>
		<!--/.col-sm-8-->
		<div class="col-sm-4">
			<h4>Our Location</h4>
			<iframe width="100%" height="215" frameborder="0" scrolling="no"
				marginheight="0" marginwidth="0"
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3010.0137497819956!2d28.95677985125026!3d41.02495512624517!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cab9f12ab56e17%3A0x9485bbf687d7cbfd!2sKadir+Has+%C3%9Cniversitesi!5e0!3m2!1sen!2str!4v1489878223028"></iframe>
		</div>
		<div id="welcomeDiv"  style="display:none;" class="loader "></div>
		<!--/.col-sm-4-->
	</div>
	</section>
	<!--/#contact-page-->
	<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>