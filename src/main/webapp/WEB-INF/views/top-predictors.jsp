<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- provides enhanced mechanism in jsp. -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
				<li class="active"><a href="top-predictors">Top Predictors</a></li>
				<li><a href="dashboard">Dashboard</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="about-me">About Me</a></li>
						<li><a href="prediction-history">Prediction History</a></li>
						<li><a href="following">Following Users</a></li>
						<c:if test="${islogin}">
							<li><a href="#"
								onclick="document.forms['logoutForm'].submit()">Logout</a></li>
						</c:if>
						<li class="divider"></li>
						<li><a href="privacy">Privacy Policy</a></li>

						<li><a href="contact-us">Contact Us</a></li>
					</ul></li>
				<c:if test="${islogin}">
					<li><a href="about-me">Welcome ${username}</a></li>
				</c:if>
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
		<h2>Best predictors for <span style="color: red;">${stockname}</span> </h2>

	</div>
	<!--/.center-->


		
	<div class="btn-group pull-right">
		<form:form method="post" modelAttribute="scoreitem">
		<div class="btn-group centered-text"><h4>Customize best predictors by Item!</h4></div>
		<form:select path="itemid" class="btn btn-danger dropdown-toggle" size="1" id="itemid">
			<option class="btn-default" value="0" >All stocks</option>
				<c:forEach items="${items}" var="item">
					<option class="btn-default" value="${item.itemid }" >${item.item_name }</option>
				</c:forEach>

			</form:select>
			
	<form:button type="submit" class="btn btn-success" value="sortbyscore" name="sortbyscore" >Sort By Score</form:button>
	<form:button type="submit" class="btn btn-success " value="sortbyaccuracy" name="sortbyaccuracy">Sort By Accuracy</form:button>	
		</form:form>
		
		
	</div>
	<div class="bootstrap-table">
		<div class="fixed-table-toolbar"></div>
		<div class="fixed-table-container" style="padding-bottom: 0px;">
			<div class="fixed-table-header" style="display: none;">
				<table></table>
			</div>
			<div class="fixed-table-body">

				<table data-toggle="table" class="table table-hover table-striped">
					<thead>
						<tr>
							<th style="" data-field="Place" tabindex="0">
								<div class="th-inner text-center">Place</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="date" tabindex="0">
								<div class="th-inner text-center">Predictor Name</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="type" tabindex="0">
								<div class="th-inner sortable both text-center">Score</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="type" tabindex="0">
								<div class="th-inner sortable both text-center">Accuracy</div>
								<div class="fht-cell"></div>
							</th>


						</tr>
					</thead>
					<tbody>
						<c:forEach items="${topPredictorsList}" var="predictor"
							varStatus="status">
							<tr>

								<td style="" class="text-center">${status.count}</td>
								<td style="" class="text-center"><a href="user-profile/${predictor.predictorName}"> ${predictor.predictorName}</a></td>
								<td style="" class="text-center">${predictor.predictorScore}</td>
								<td style="" class="text-center">${predictor.predictorAccuracy}</td>

							</tr>

						</c:forEach>



					</tbody>
				</table>
			</div>
			<div class="fixed-table-footer" style="display: none;">
				<table>
					<tbody>
						<tr></tr>
					</tbody>
				</table>
			</div>
			<div class="fixed-table-pagination" style="display: none;"></div>
		</div>
	</div>

	</section>


	<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>