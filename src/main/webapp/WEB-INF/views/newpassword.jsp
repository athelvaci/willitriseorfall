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
                <a class="navbar-brand" href="../../index"><img src="<c:url  value="../../resources/images/logo.png" />" alt="logo2"></a>
            </div>
            
        </div>
    </header><!--/header-->

    <section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h1>New Password</h1>
                    <p>Change your password</p>
                </div>
                <div class="col-sm-6">
                    
                </div>
            </div>
        </div>
    </section><!--/#title-->     

    <section id="signup" class="container signup">
        
        <div class="form-wrap">
            <h1>Enter your new password</h1>
            
        
        <form:form method="POST" modelAttribute="newpassword" class="center">
         <fieldset id="signup-form" class="registration-form">

        <spring:bind path="password">
            <div class="form-group  ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="New password"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="passwordConfirm">
            <div class="form-group  ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="passwordConfirm" class="form-control"
                            placeholder="Confirm your New password"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-success btn-md btn-block" type="submit">Submit</button>
         </fieldset>
    </form:form>
            </div>
    </section><!--/#registration-->
     <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<section id="bottom" class="wet-asphalt">
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <h4>About Us</h4>
                    <p>Kadir has university computer science graduation project.<br> Will it rise or fall project created by:</p>
                     <ul>
                        <li >
                            <h5>Arif Selcuk Ogrenci</h5>
                        </li>
                         <li >
                            <h5>Ahmet Tufan Helvaci</h5>
                        </li>
                         <li >
                            <h5>Muhammed Erdem Akkuzu</h5>
                        </li>
                       
                    </ul>
                   
                </div><!--/.col-md-3-->
                
                <div class="col-sm-4 ">
                    <h4>Address</h4>
                    <address>
                        <strong>Kadir Has University</strong><br>
                        Cibali, Kadir Has Ünv.<br>
                        34083 Fatih/Istanbul<br>
                    </address>
                    
                   
                    <form role="form">
                        <div class="input-group">
                           
                        </div>
                    </form>
                </div> <!--/.col-md-3-->
            </div>
        </div>
    </section><!--/#bottom-->

<footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2017 Athelvaci . All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="about-us.html">About Us</a></li>
                        <li><a href="privacy.html">Privacy Policy</a></li>
                        <li><a href="terms.html">Terms of use</a></li>
                        <li><a href="contact-us.html">Contact Us</a></li>
                        <li><a id="gototop" class="gototop" href="#"><i class="icon-chevron-up"></i></a></li><!--#gototop-->
                    </ul>
                </div>
            </div>
        </div>
    </footer><!--/#footer-->

    <script src="../../resources/js/jquery.js"></script>
    <script src="../../resources/js/bootstrap.min.js"></script>
    <script src="../../resources/js/jquery.prettyPhoto.js"></script>
    <script src="../../resources/js/main.js"></script>

</body>
</html>