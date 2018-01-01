<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> <!-- dont forget to add to another files -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
                           
                             <li><a href="contact-us">Contact Us</a></li>
                        </ul>
                    </li>
					<li><a href="login">Log in</a></li>
                    <li  class="active"><a href="signup">Sign up</a></li>
                </ul>
            </div>
        </div>
    </header><!--/header-->

    <section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h1>Sign up</h1>
                    <p>Sign up to use site all features</p>
                </div>
                <div class="col-sm-6">
                    <ul class="breadcrumb pull-right">
                        <li><a href="index">Home</a></li>
                        <li class="active">Sign up</li>
                    </ul>
                </div>
            </div>
        </div>
    </section><!--/#title-->     

    <section id="signup" class="container signup">
        
        <div class="form-wrap">
            <h1>Create an account</h1>
            
        
        <form:form method="POST" modelAttribute="userForm" class="center">
         <fieldset id="signup-form" class="registration-form">
        
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
            
                <form:input type="text" path="username" class="form-control" placeholder="Username"
                            autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="email">
             <div class="form-group ${status.error ? 'has-error' : ''}">
                 <form:input type="text" path="email" class="form-control" placeholder="Email"
                             autofocus="true"></form:input>
                 <form:errors path="email"></form:errors>
             </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="passwordConfirm" class="form-control"
                            placeholder="Confirm your password"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-success btn-md btn-block" type="submit" >Sign up</button>
         </fieldset>
    </form:form>
            </div>
    </section><!--/#registration-->
     <jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>