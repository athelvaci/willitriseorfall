<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> <!-- dont forget to add to another files -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

   <jsp:include page="../views/fragments/header.jsp"></jsp:include>

</head><!--/head-->

<body>
    <header class="navbar navbar-inverse navbar-fixed-top wet-asphalt" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index"><img src="resources/images/logo.png" alt="logo"></a>
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
                    <li class="dropdown" >
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li class="active"><a href="about-me">About Me</a></li>
                            <li><a href="prediction-history">Prediction History</a></li>
                            <li><a href="following">Following Users</a></li>
                            <li><a href="#" onclick="document.forms['logoutForm'].submit()">Logout</a></li>
                            <li class="divider"></li>
                            <li><a href="privacy">Privacy Policy</a></li>
                           
                            <li><a href="contact-us">Contact Us</a></li>
                        </ul>
                    </li>
                    <li><a href="about-me">Welcome ${pageContext.request.userPrincipal.name} </a></li> 
                </ul>
            </div>
        </div>
    </header><!--/header-->

    <section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h1>About Me</h1>
                    <p>See your scores.</p>
                </div>
                <div class="col-sm-6">
                    <ul class="breadcrumb pull-right">
                        <li><a href="index">Home</a></li>
                        <li><a href="#">Pages</a></li>
                        <li class="active">About Me</li>
                    </ul>
                </div>
            </div>
        </div>
    </section><!--/#title-->        

   <section id="aboutme" class="container">
       <h2><b>Username:</b>${username}</h2>
       <h2><b>Email:</b>${useremail}</h2>
       <div class="gap"></div>
       <h2 class="text-center">Scores</h2>
									<div class="container" id="stockchart">

										<div class="row">
											<div class="progress-type col-sm-2">
												Stock:<span style="color: green">All Stocks</span> <br>
												Score: <span style="color: green">${score.score}</span>
											</div>


											<div class="progress col-sm-10">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="60" aria-valuemin="0"
													aria-valuemax="100" style="width: ${score.accuracy}%;">
													<span class="pull-right">${score.accuracy}%
														accuracy.</span>
												</div>


											</div>

										</div>

									

									<c:forEach items="${items}" var="item" varStatus="status">
										<c:set var="scoreid" value="s${item.itemid}"></c:set>

										

											<div class="row">
												<div class="progress-type col-sm-2">
													Stock:<span style="color: green">${item.item_name}</span> <br>
													Score: <span style="color: green">${requestScope[scoreid].score}</span>
												</div>


												<div class="progress col-sm-10">
													<div class="progress-bar progress-bar-success"
														role="progressbar" aria-valuenow="60" aria-valuemin="0"
														aria-valuemax="100"
														style="width: ${requestScope[scoreid].accuracy}%;">
														<span class="pull-right">${requestScope[scoreid].accuracy}%
															accuracy.</span>
													</div>


												</div>

											</div>

									</c:forEach>
										</div>
        
    </section>
    


								
     <jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>