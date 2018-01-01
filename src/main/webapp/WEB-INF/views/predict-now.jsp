<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- dont forget to add to another files -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
				<li class="active"><a href="predict-now">Predict Now</a></li>
				<li><a href="top-predictors">Top Predictors</a></li>
				<li><a href="dashboard">Dashboard</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="about-me">About Me</a></li>
						<li><a href="prediction-history">Prediction History</a></li>
						<li><a href="following">Following Users</a></li>
						<li><a href="#"
							onclick="document.forms['logoutForm'].submit()">Logout</a></li>
						<li class="divider"></li>
						<li><a href="privacy">Privacy Policy</a></li>
				
						<li><a href="contact-us">Contact Us</a></li>
					</ul></li>

				<li><a href="about-me">Welcome
						${pageContext.request.userPrincipal.name} </a></li>
			</ul>
		</div>

	</div>
	</header>
	<!--/header-->

	<section id="title" class="emerald">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h1>Predict Now</h1>
				<p>Predict stock quotes now.</p>


			</div>
			<div class="col-sm-6">
				<ul class="breadcrumb pull-right">
					<li><a href="index">Home</a></li>
					<li class="active">Predict Now</li>
				</ul>
			</div>
		</div>
	</div>
	</section>
	<!--/#title-->



		<section id="prediction" class="container">
		

		<!-- prediction item select -->
		<div class="btn-group">

			<select path="itemid" class="btn btn-danger dropdown-toggle"
				size="1" id="stocktype">

				<c:forEach items="${items}" var="item">
					<option class="btn-default" value="${item.itemid }" >${item.item_name}</option>
					
					
				</c:forEach>

			</select>
			
		</div>
		<div >
		
		
		</div>



		<div class="gap"></div>
		<!-- prediction view start -->
		<c:forEach items="${items}" var="item">
	
			<!-- check if user can predict or not "cantpredict"-->
			<div class="row group " id="${item.itemid}">
			
			 <form:form method="post" modelAttribute="predictionmodel">
			 <form:hidden path="itemid" value="${item.itemid}" />
			 
			 <c:set var="update" value="update${item.itemid}"></c:set>
			 <c:set var="canupdate" value="${ requestScope[update]}"></c:set>
			 
			  <c:set var="oldpredictionitem" value="oldprediction${item.itemid}"></c:set>
			 <c:set var="oldprediction" value="${ requestScope[oldpredictionitem]}"></c:set>
			 
			 <c:set var="currentvalueitem" value="currentvalue${item.itemid}"></c:set>
			 <c:set var="currentvalue" value="${ requestScope[currentvalueitem]}"></c:set>
			 
			<!-- make blur if user cant predict -->
			 <c:choose>
			 <c:when test="${canupdate == '1'}">
			 
			 <c:set var="cantpredict" value="cantpredict"></c:set>
			 </c:when>
			 <c:otherwise>
			 
			 <c:set var="cantpredict" value=""></c:set>
			 </c:otherwise>
			 
			 </c:choose>
			 
			 
			 <div class="${cantpredict}">
				
				<div class="col-sm-2 col-xs-12 top-buffer" id="dollar-logo">
					<img src="resources/images/currencylogo/${item.item_name}.png"
						class="img-responsive center-block" alt="${item.item_name } logo"
						width="150" height="150">
				</div>
				<div class="col-sm-2 col-xs-12" id="changerates">
					<table class="table">
						<thead>
							<tr>
								<h4>Stock: ${item.item_name}</h4>
								<th>Time</th>
								<th>Value</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Yesterday</td>
								<td>${item.item_value}</td>

							</tr>
							<tr>
								<td>Now</td>
								<td>${currentvalue}</td>

							</tr>

						</tbody>
					</table>

				</div>
				<div class="col-sm-3 col-xs-12 center predictioncomment"
					id="predictioncomment">

					<form:textarea path="prediction_comment" class="form-control"
						rows="5" placeholder="Prediction Comment"></form:textarea>
				</div>
				<div class="col-sm-5 col-xs-12 center" id="buttons">
					<h2 class="clearfix">WILL IT RISE OR FALL?</h2>
					<p>Latest prediction time ${predictioninterval}</p>
					
					<div class="radio-toolbar" data-toggle="buttons">
						<label class="btn btn-success btn-circle btn-lg">
						 <form:radiobutton   value="rise" path="prediction_point" title="Rise"/> <span><i class="icon-arrow-up"></i> </span>
						</label>
						 <label class="btn btn-warning  btn-circle btn-lg ">
							 <form:radiobutton   value="stable" checked="checked" path="prediction_point" title="Stable"/><span><i
								class="icon-minus"></i></span>
						</label> 
						<label class="btn btn-danger  btn-circle btn-lg"> 
						 <form:radiobutton  value="fall" path="prediction_point" /><span><i
								class="icon-arrow-down" title="Fall"></i></span>
						</label>
					</div>
					<div class="gap"></div>
				</div>
				
					</div>	<!-- end of opacity -->
			
			<c:choose>
			<c:when test="${canupdate == '1'}">
			<h3 align="center">You have already predicted ${item.item_name} will ${oldprediction.prediction_point} for tomorrow! You can update your prediction until ${predictioninterval}</h3>
			
			<form:button type="submit"  class="btn btn-success btn-block" value="update" name="update">Update your prediction</form:button>
			</c:when>
			<c:otherwise>
			<form:button type="submit"  class="btn btn-success btn-block" value="predict" name="predict">Submit your prediction</form:button>
			</c:otherwise>
			</c:choose>
				<!--end of buttons-->
			</form:form>
			<div class="gap"></div>
			
			<!-- start of yahoo chart -->
			
			 <c:set var="itemchart" value="chart${item.item_name}"></c:set>
			 <c:set var="chartid" value="${ requestScope[itemchart]}"></c:set>
			<div class="container center">	<img alt="chart" class="text-center" src="https://chart.finance.yahoo.com/z?s=${chartid}&t=6m&q=l&l=on&z=s&p"></div>
			
		
			</div>

		</c:forEach>
		<!-- prediction view end -->
		<!-- Prediction button -->
		
		


		


	 <!-- end of prediction form --> </section>

	<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>