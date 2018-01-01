<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<link rel="stylesheet" href="<spring:url value="/resources/css/arrow.css"/>" type="text/css"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- dont forget to add to another files -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				src="resources/images/logo.png" alt="logo" title="Home"></a>
		</div>
		<div class="collapse navbar-collapse">
		 <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index">Home</a></li>
				<li><a href="predict-now">Predict Now</a></li>
				<li><a href="top-predictors">Top Predictors</a></li>
				<li><a href="dashboard">Dashboard</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="about-me">About Me</a></li>
						<li class="active"><a href="prediction-history">Prediction
								History</a></li>
						<li><a href="following">Following Users</a></li>
						 <li><a href="#" onclick="document.forms['logoutForm'].submit()">Logout</a></li>
						<li class="divider"></li>
						<li><a href="privacy">Privacy Policy</a></li>
					
						<li><a href="contact-us">Contact Us</a></li>
					</ul></li>
				<li><a href="about-me">Welcome ${pageContext.request.userPrincipal.name} </a></li> 
			</ul>
		</div>
	</div>
	</header>
	<!--/header-->

	<section id="title" class="emerald">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h1>Prediction History</h1>
				<p>Find your ex-predictions.</p>
			</div>
			<div class="col-sm-6">
				<ul class="breadcrumb pull-right">
					<li><a href="index">Home</a></li>
					<li><a href="#">Pages</a></li>
					<li class="active">Prediction History</li>
				</ul>
			</div>
		</div>
	</div>
	</section>
	<!--/#title-->

	<section class="container"><!--/#table-->
	<div class="center">
		<h2>Your old predictions</h2>

	</div>
	<div class="btn-group pull-right">
		<form:form method="post" modelAttribute="categorizeitem">
		<div class="btn-group centered-text"><h4>Customize by item</h4></div>
		<form:select path="itemid" class="btn btn-danger dropdown-toggle" size="1" id="itemid">
			<option class="btn-default" value="0" >All Predictions</option>
				<c:forEach items="${items}" var="item">
					<option class="btn-default" value="${item.itemid }" >${item.item_name }</option>
				</c:forEach>

			</form:select>
	<button type="submit" class="btn btn-success" >Submit</button>
		
		</form:form>
		
		
	</div>
	<!--/.center-->

	<div class="bootstrap-table">
		<div class="fixed-table-toolbar"></div>
		<div class="fixed-table-container" style="padding-bottom: 0px;">
			<div class="fixed-table-header" style="display: none;">
				<table></table>
			</div>
			<div class="fixed-table-body">
				
				<table data-toggle="table" class="table table-hover table-striped the-table">
					<thead>
						<tr>
							<th style="" data-field="predict-date" tabindex="0">
								<div class="th-inner ">Date</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="predict-item" tabindex="0">
								<div class="th-inner text-center">Item</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="prediction" tabindex="0">
								<div class="th-inner sortable both text-center">Predicted</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="predict-result" tabindex="0">
								<div class="th-inner">Comment</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="predict-from" tabindex="0">
								<div class="th-inner sortable both text-center">Start Value</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="predict-from" tabindex="0">
								<div class="th-inner sortable both text-center">End Value</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="predict-result" tabindex="0">
								<div class="th-inner text-center">Result</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="predict-result" tabindex="0">
								<div class="th-inner text-center">Success</div>
								<div class="fht-cell"></div>
							</th>
							

						</tr>
					</thead>
					<tbody>
					
				
					
					
					<c:forEach items="${oldpredictions}" var="prediction" varStatus="status" >
					<c:choose>
					<c:when test="${prediction.prediction_point == 'rise'}">
					<c:set var="iconpoint" value="icon-arrow-up"></c:set>
					</c:when>
					<c:when test="${prediction.prediction_point == 'stable'}">
					<c:set var="iconpoint" value="icon-minus"></c:set>
					</c:when>
					<c:otherwise>
					<c:set var="iconpoint" value="icon-arrow-down"></c:set>
					</c:otherwise>
					</c:choose>
					
					<c:choose>
					<c:when test="${prediction.predictionfinalscore > '0'}">
					<c:set var="iconresult" value="icon-ok"></c:set>
					</c:when>
					<c:otherwise>
					<c:set var="iconresult" value="icon-remove"></c:set>
					</c:otherwise>
					</c:choose>
					
					<tr data-index="1">
							<td  class=" "><fmt:formatDate value="${prediction.predictiontime}" pattern="yyyy-MM-dd" /></td>
							
							<c:set var="itemid" value="i${prediction.itemid}"></c:set>
							<td style="" class="text-center">${requestScope[itemid]}</td>
							<td style="" class="text-center"><i class="${iconpoint}"></i>
							</td>
							<td style="" class="">${prediction.prediction_comment}</td>
							<td style="" class="text-center">${prediction.item_value_begining}</td>
							<td style="" class="text-center">${prediction.item_value_end}</td>
							<td style="" class="text-center">${prediction.prediction_result}</td>
							<td style="" class="text-center"><i class="${iconresult}"></i></td>
							
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