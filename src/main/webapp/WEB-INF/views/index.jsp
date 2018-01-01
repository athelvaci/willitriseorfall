<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- dont forget to add to another files -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- provides enhanced mechanism in jsp. -->
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
				<li class="active"><a href="index">Home</a></li>
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
	<section id="main-slider" class="no-margin">
	<div class="carousel slide wet-asphalt">
		<ol class="carousel-indicators">
			<li data-target="#main-slider" data-slide-to="0" class="active"></li>
			<li data-target="#main-slider" data-slide-to="1"></li>
			<li data-target="#main-slider" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active"
				style="background-image: url(resources/images/slider/bg1.jpg)">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="carousel-content centered">
								<h2 class="boxed animation animated-item-1">Predict stock
									quotes and see others predictions</h2>
								<p class="boxed animation animated-item-2">It is a perfect
									site to take suggestions for stock quotes. Clear your concerns
									and choose the true investment stock.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.item-->
			<div class="item"
				style="background-image: url(resources/images/slider/bg2.jpg)">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="carousel-content center centered">
								<h2 class="boxed animation animated-item-1">Don't you have
									an account?</h2>
								<br>
								<p class="boxed animation animated-item-2">Click to below
									link and create account within seconds.</p>
								<br> <a class="btn btn-md animation animated-item-3"
									href="signup">Sign up</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.item-->
			<div class="item"
				style="background-image: url(resources/images/slider/bg3.jpg)">
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							<div class="carousel-content centered">
								<h2 class="boxed animation animated-item-1">Are you
									confused about this site?</h2>
								<p class="boxed animation animated-item-2">You can watch
									this tutorial video to understand more about this site.</p>
							</div>
						</div>
						<div class="col-sm-6 hidden-xs animation animated-item-4">
							<div class="centered">
								 <div class="embed-container">
                                        <iframe width="420" height="315" src="https://www.youtube.com/embed/QZ6vAXX5e0E" ></iframe>
                                    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.item-->
		</div>
		<!--/.carousel-inner-->
	</div>
	<!--/.carousel--> <a class="prev hidden-xs" href="#main-slider"
		data-slide="prev"> <i class="icon-angle-left"></i>
	</a> <a class="next hidden-xs" href="#main-slider" data-slide="next"> <i
		class="icon-angle-right"></i>
	</a> </section>
	<!--/#main-slider-->

	<section id="services" class="emerald">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="media">
					<div class="pull-left">
						<i class="icon-eur icon-md"></i>
					</div>
					<div class="media-body">
						<h3 class="media-heading">Euro Predictions</h3>
						<p>You can make current Euro exchange predictions and you can
							see other users predictions and comments.</p>
					</div>
				</div>
			</div>
			<!--/.col-md-4-->
			<div class="col-md-3 col-sm-6">
				<div class="media">
					<div class="pull-left">
						<i class="icon-dollar icon-md"></i>
					</div>
					<div class="media-body">
						<h3 class="media-heading">Dollar Predictions</h3>
						<p>You can make current Dollar exchange predictions and you
							can see other users predictions and comments.</p>
					</div>
				</div>
			</div>
			<!--/.col-md-4-->
			<div class="col-md-3 col-sm-6">
				<div class="media">
					<div class="pull-left">
						<i class="icon-gbp icon-md"></i>
					</div>
					<div class="media-body">
						<h3 class="media-heading">Pound Predictions</h3>
						<p>You can make current Pound exchange predictions and you can
							see other users predictions and comments.</p>
					</div>
				</div>
			</div>
			<!--/.col-md-4-->
			<div class="col-md-3 col-sm-6">
				<div class="media">
					<div class="pull-left">
						<i class="icon-exchange icon-md"></i>
					</div>
					<div class="media-body">
						<h3 class="media-heading">Other Exchange Predictions</h3>
						<p>You can also make other exchange predictions which we will
							add more in soon.</p>
					</div>
				</div>
			</div>
			<!--/.col-md-4-->
		</div>
	</div>
	</section>
	<!--/#services-->

	<!--/#current exchange rates-->
	<section id="pricing">

	<div class="container">

		<div class="center">
			<h2>See current exchange rates:</h2>

		</div>
		<!--/.center-->
		<div class="gap"></div>
		<div id="pricing-table" class="row">
			<div class="col-md-3 col-xs-6">
				<ul class="plan plan1">
					<li class="plan-name">
						<h3>Euro</h3>
					</li>
					<li class="plan-price">
						<div>
							<span class="price">${euro} </span> <small>Current</small>
						</div>
					</li>

					<li class="plan-price"><strong>Yesterday:</strong> ${oldeuro}</li>
					<li><strong>Will it Rise or Fall ?</strong></li>

					<li class="plan-action"><a href="predict-now"
						class="btn btn-primary btn-md">Predict</a></li>

				</ul>
			</div>
			<!--/.col-md-3-->
			<div class="col-md-3 col-xs-6">
				<ul class="plan plan2 featured">
					<li class="plan-name">
						<h3>Dollar</h3>
					</li>
					<li class="plan-price">
						<div>
							<span class="price">${dollar}</span> <small>Current</small>
						</div>
					</li>

					<li class="plan-price"><strong>Yesterday:</strong>  ${olddollar}</li>
					<li><strong>Will it Rise or Fall ?</strong></li>

					<li class="plan-action"><a href="predict-now"
						class="btn btn-primary btn-md">Predict</a></li>
				</ul>
			</div>
			<!--/.col-md-3-->
			<div class="col-md-3 col-xs-6 ">
				<ul class="plan plan3">
					<li class="plan-name">
						<h3>Pound</h3>
					</li>
					<li class="plan-price">
						<div>
							<span class="price">${pound}</span> <small>Current</small>
						</div>
					</li>

					<li class="plan-price"><strong>Yesterday:</strong>  ${oldpound}</li>
					<li><strong>Will it Rise or Fall ?</strong></li>

					<li class="plan-action"><a href="predict-now"
						class="btn btn-primary btn-md">Predict</a></li>
				</ul>
			</div>
			<!--/.col-md-3-->
			<div class="col-md-3 col-xs-6">
				<ul class="plan plan4 featured">
					<li class="plan-name">
						<h3>IMKB</h3>
					</li>
					<li class="plan-price">
						<div>
							<span class="price">${imkb}</span> <small>Current</small>
						</div>
					</li>

					<li class="plan-price"><strong>Yesterday:</strong>  ${oldimkb}</li>
					<li><strong>Will it Rise or Fall ?</strong></li>

					<li class="plan-action"><a href="predict-now"
						class="btn btn-primary btn-md">Predict</a></li>
				</ul>
			</div>
			<!--/.col-md-3-->
		</div>
	</div>
	</section>
	<!--/#pricing-->



	 <section id="testimonial" class="alizarin">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="center">
                        <h2>How to use willitriseorfall.com?</h2>
                        <p>This web-site will provide users an opportunity to predict and share their opinion about financial investment materials in daily situations.</p>
                    </div>
                    <div class="gap"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <blockquote>
                                <p>Use Predict now page for  make predictions with choosing stock quotes.</p>
                               <small> <a href="predict-now" class="btn btn-success btn-md">Predict Now</a></small>
                                
                            </blockquote>
                            <blockquote>
                                <p>Use Top predictors page to see best predictors for every item. You can also customize best predictors by their score and accuracy</p>
                                <small> <a href="top-predictors" class="btn btn-success btn-md">Top Predictors</a></small>
                            </blockquote>
                        </div>
                        <div class="col-md-6">
                            <blockquote>
                                <p>Use Dashboard page to see last predictions from our users.</p>
                                <small> <a href="dashboard" class="btn btn-success btn-md">Dashboard</a></small>
                            </blockquote>
                            <blockquote>
                                <p>You can also follow users and see their prediction history and scores in every item from their profile</p>
                                <small> <a href="following" class="btn btn-success btn-md">Following Users</a></small>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section><!--/#testimonial-->
	<!--/#testimonial-->



	<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>