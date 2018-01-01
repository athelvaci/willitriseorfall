<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- dont forget to add to another files -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../views/fragments/header.jsp"></jsp:include>

</head>
<header class="navbar navbar-inverse navbar-fixed-top wet-asphalt"
	role="banner">
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index"><img
			src="resources/images/logo.png"></a>
	</div>
	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="index">Home</a></li>
			<li><a href="predict-now">Predict Now</a></li>
			<li><a href="top-predictors">Top Predictors</a></li>
			<li><a href="dashboard">Dashboard</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
				<ul class="dropdown-menu">
					<li><a href="about-me">About Me</a></li>
					<li><a href="prediction-history">Prediction History</a></li>
					<li><a href="following">Following Users</a></li>
					<li class="divider"></li>
					<li><a href="privacy">Privacy Policy</a></li>
				
				</ul></li>
			<li><a href="login">Log in</a></li>
			<li><a href="signup">Sign up</a></li>
		</ul>
	</div>
</div>
</header>
<!--/header-->



<section id="error" class="container">
<div class="container">
	<div class="row">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
					
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">Forgot Password?</h2>
							<p>Please enter your username. We will send your password to
								your mail address.</p>
								
							<div class="panel-body">

								<form class="form" 
									action=" <spring:url value="/forgettenpassword?${_csrf.parameterName}=${_csrf.token}"></spring:url>" method="post">
									<fieldset>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span> 
													<input placeholder="username" class="form-control" type="username" required="" name="username"/>
											</div>
										</div>
										<img src="/images/loading.gif" id="loading-indicator" style="display:none" />
								<div id="welcomeDiv"  style="display:none;" class="loader "></div>
										<div class="form-group">
											<input class="btn btn-lg btn-success btn-block"
												value="Send My Password" type="submit"  onclick="showDiv()"/>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<!--/#error-->
<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>