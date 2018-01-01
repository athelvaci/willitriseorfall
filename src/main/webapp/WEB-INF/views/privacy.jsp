<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- provides enhanced mechanism in jsp. -->
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- dont forget to add to another files -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<jsp:include page="../views/fragments/header.jsp"></jsp:include>
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
				<li ><a href="top-predictors">Top
						Predictors</a></li>
				<li><a href="dashboard">Dashboard</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="about-me">About Me</a></li>
						<li><a href="prediction-history">Prediction History</a></li>
						<li><a href="following">Following Users</a></li>
						<c:if test="${islogin}"><li><a href="#" onclick="document.forms['logoutForm'].submit()">Logout</a></li></c:if>
						<li class="divider"></li>
						<li class="active"><a href="privacy">Privacy Policy</a></li>
						
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
				<h1>Privacy policy</h1>
				<p>www.willitriseorfall.com Privacy Policy</p>
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


<section id="terms" class="container">
        <h3>Introduction</h3>
        <p>This privacy policy has been compiled to better serve those who are concerned with how their 'Personally Identifiable Information' (PII) is being used online. PII, as described in US privacy law and information security, is information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website.</p>

        <p>&nbsp;</p>

        <h3>What personal information do we collect from the people that visit our blog, website or app?</h3>
        <p>When ordering or registering on our site, as appropriate, you may be asked to enter your name, email address, mailing address or other details to help you with your experience.</p>

        <p>&nbsp;</p>

        <h3>When do we collect information?</h3>
        <p>We collect information from you when you register on our site, fill out a form or enter information on our site.</p>

        <p>&nbsp;</p>
        <h3>How do we use your information?</h3>
        <p>We may use the information we collect from you when you register, make a purchase, sign up for our newsletter, respond to a survey or marketing communication, surf the website, or use certain other site features in the following ways:

      To improve our website in order to better serve you.
      To administer a contest, promotion, survey or other site feature.
      To ask for ratings and reviews of services or products</p>
         <p>&nbsp;</p>
       
       
         <p>&nbsp;</p>
        <h3>Anti-fraud</h3>
        <p>We do not use vulnerability scanning and/or scanning to PCI standards.
We only provide articles and information. We never ask for credit card numbers.
We do not use Malware Scanning.

We do not use an SSL certificate
       We only provide articles and information. We never ask for personal or private information like names, email addresses, or credit card numbers.</p>

        <p>&nbsp;</p>
        <h3>
Do we use 'cookies'?</h3>
        <p>
We do not use cookies for tracking purposes

You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies. You do this through your browser settings. Since browser is a little different, look at your browser's Help Menu to learn the correct way to modify your cookies.

If you turn cookies off, Some of the features that make your site experience more efficient may not function properly.that make your site experience more efficient and may not function properly.
</p>
        <p>&nbsp;</p>

        <h3>Third-party disclosure</h3>
        <p>We do not sell, trade, or otherwise transfer to outside parties your Personally Identifiable Information.</p>
    </section><!--/#terms-->


	<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>