<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index">Home</a></li>
                    <li><a href="predict-now">Predict Now</a></li>
                    <li><a href="top-predictors">Top Predictors</a></li>
                    <li><a href="dashboard">Dashboard</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="about-me">About Me</a></li>
                            <li><a href="prediction-history">Prediction History</a></li>
                            <li><a href="following">Following Users</a></li>
                            
                            <li class="divider"></li>
                            <li><a href="privacy">Privacy Policy</a></li>
                        
                        </ul>
                    </li>
					<li><a href="login">Log in</a></li>
                    <li><a href="signup">Sign up</a></li>
                </ul>
            </div>
        </div>
    </header><!--/header-->

    <section id="error" class="container">
        <h1>${thankyouresponse}</h1>
        
        <a class="btn btn-success" href="predict-now">PREDICT NOW</a>
    </section><!--/#error-->
<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>