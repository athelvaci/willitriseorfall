<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<link rel="stylesheet" href="<spring:url value="/resources/css/arrow.css"/>" type="text/css"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../views/fragments/header.jsp"></jsp:include>
</head>
<header class="navbar navbar-inverse navbar-fixed-top wet-asphalt" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index"><img src="resources/images/logo.png"></a>
            </div>
            <div class="collapse navbar-collapse">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
            
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index">Home</a></li>
                    <li><a href="predict-now">Predict Now</a></li>
                    <li><a href="top-predictors">Top Predictors</a></li>
                     <li class="active"><a href="dashboard">Dashboard</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="about-me">About Me</a></li>
                            <li><a href="prediction-history">Prediction History</a></li>
                            <li><a href="following">Following Users</a></li>
                             <li><a href="#" onclick="document.forms['logoutForm'].submit()">Logout</a></li>
                          
                            <li class="divider"></li>
                            <li><a href="privacy">Privacy Policy</a></li>
                     <li><a href="contact-us">Contact Us</a></li>
                        </ul>
                    </li>
					<li><a href="about-me">Welcome
						${pageContext.request.userPrincipal.name} </a></li>
						
                </ul>
            </div>
        </div>
    </header><!--/header-->
    <section id="title" class="emerald">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h1>Dashboard</h1>
				<p>Latest Predictions from our users</p>


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

    <section class="container"><!--/#table-->
	<div class="center">
		<h2>Latest predictions from our users</h2>

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
								<div class="th-inner text-center">Date</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="predict-date" tabindex="0">
								<div class="th-inner text-center">User</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="predict-item" tabindex="0">
								<div class="th-inner text-center">Item</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="prediction" tabindex="0">
								<div class="th-inner sortable both text-center">Prediction</div>
								<div class="fht-cell"></div>
							</th>
							<th style="" data-field="predict-result" tabindex="0">
								<div class="th-inner text-center">Comment</div>
								<div class="fht-cell"></div>
							</th>
						
							

						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${oldpredictions}" var="prediction" varStatus="status" >
					<c:choose>
					<c:when test="${prediction.predictionPoint == 'rise'}">
					<c:set var="iconpoint" value="icon-arrow-up"></c:set>
					</c:when>
					<c:when test="${prediction.predictionPoint == 'stable'}">
					<c:set var="iconpoint" value="icon-minus"></c:set>
					</c:when>
					<c:otherwise>
					<c:set var="iconpoint" value="icon-arrow-down"></c:set>
					</c:otherwise>
					</c:choose>
					
					
					
					<tr data-index="1">
							<td  class=" text-center"><fmt:formatDate value="${prediction.predictionDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							
							<td  class=" text-center"><a href="user-profile/${prediction.userName}"> ${prediction.userName}</a></td> 
							<c:set var="itemid" value="i${prediction.itemid}"></c:set>
							
							<td style="" class="text-center">${requestScope[itemid]}</td>
							
							<td style="" class="text-center"><i class="${iconpoint}"></i>
							</td>
							<td style="" class="">${prediction.comment}</td>
							
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