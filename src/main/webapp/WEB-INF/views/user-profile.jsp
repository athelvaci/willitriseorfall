<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/profile.css"/>" type="text/css" />
	<link rel="stylesheet" href="<spring:url value="/resources/css/arrow.css"/>" type="text/css"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
			<a class="navbar-brand" href="../index"><img
				src="<c:url  value="../resources/images/logo.png" />" alt="logo"></a>

		</div>
		<div class="collapse navbar-collapse">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../index">Home</a></li>
				<li><a href="../predict-now">Predict Now</a></li>
				<li><a href="../top-predictors">Top Predictors</a></li>
				<li><a href="../dashboard">Dashboard</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> My Page <i class="icon-angle-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="../about-me">About Me</a></li>
						<li><a href="../prediction-history">Prediction History</a></li>
						<li><a href="../following">Following Users</a></li>
						<li><a href="#"
							onclick="document.forms['logoutForm'].submit()">Logout</a></li>
						<li class="divider"></li>
						<li><a href="../privacy">Privacy Policy</a></li>

						<li><a href="../contact-us">Contact Us</a></li>
					</ul></li>
				<li><a href="../about-me">Welcome
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
				<h1>User Profile</h1>
				<p>You can see Scores and Last predictions of our users</p>
			</div>
			<div class="col-sm-6"></div>
		</div>
	</div>
	</section>
	<!--/#title-->
	<c:choose>
		<c:when test="${exist == '0'}">
			<div class="gap"></div>
			<div class="gap"></div>
			<div class="center">
				<h1>There is no user with this name!</h1>
			</div>
			<div class="gap"></div>
			<div class="gap"></div>
		</c:when>
		<c:otherwise>



			<div class="container">
				<div class="gap"></div>
				<section class="container"><!--/#table-->
				<div class="center">

					<div class="btn-group pull-right">
						<form:form method="post" modelAttribute="followactivity">
							<form:hidden path="followinguserid" value="${score.userId}" />
							<c:choose>
								<c:when test="${canfollow == '1'}">
									<form:button type="submit" class="btn btn-success "
										value="follow" name="follow">Follow This User</form:button>
								</c:when>
								<c:otherwise>
									<form:button type="submit" class="btn btn-success "
										value="unfollow" name="unfollow">Unfollow This User</form:button>
								</c:otherwise>
							</c:choose>

						</form:form>
					</div>
				</div>


				</section>
				<div class="col-md-12 col-xs-12">
					<div class="panel with-nav-tabs panel-info">
						<div class="panel-heading">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab3info" data-toggle="tab">Profile</a></li>
								<li><a href="#tab1info" data-toggle="tab">Scores</a></li>
								<li><a href="#tab2info" data-toggle="tab">Prediction
										History</a></li>

								<li class="dropdown hidden"><a href="#"
									data-toggle="dropdown">Dropdown <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#tab4info" data-toggle="tab">Info 4</a></li>
										<li><a href="#tab5info" data-toggle="tab">Info 5</a></li>
									</ul></li>
							</ul>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane fade  in active" id="tab3info">
									<h2>
										<span style="color: green">User Name: </span> ${username}
									</h2>
									<h2>
										<span style="color: green">Email: </span> ${useremail}
									</h2>
								</div>
								<div class="tab-pane fade " id="tab1info">

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

								</div>
								<div class="tab-pane fade" id="tab2info">
									

										
											
											<div class="timeline-label">
												<h2>
													<span style="color: green">Prediction history of
														${username}</span>
												</h2>
												<div class="bootstrap-table">
													
														
														<div class="fixed-table-body">

															<table data-toggle="table"
																class="table table-hover table-striped the-table">
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
																			<div class="th-inner sortable both text-center">Start
																				Value</div>
																			<div class="fht-cell"></div>
																		</th>
																		<th style="" data-field="predict-from" tabindex="0">
																			<div class="th-inner sortable both text-center">End
																				Value</div>
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




																	<c:forEach items="${oldpredictions}" var="prediction"
																		varStatus="status">
																		<c:choose>
																			<c:when
																				test="${prediction.prediction_point == 'rise'}">
																				<c:set var="iconpoint" value="icon-arrow-up"></c:set>
																			</c:when>
																			<c:when
																				test="${prediction.prediction_point == 'stable'}">
																				<c:set var="iconpoint" value="icon-minus"></c:set>
																			</c:when>
																			<c:otherwise>
																				<c:set var="iconpoint" value="icon-arrow-down"></c:set>
																			</c:otherwise>
																		</c:choose>

																		<c:choose>
																			<c:when
																				test="${prediction.predictionfinalscore > '0'}">
																				<c:set var="iconresult" value="icon-ok"></c:set>
																			</c:when>
																			<c:otherwise>
																				<c:set var="iconresult" value="icon-remove"></c:set>
																			</c:otherwise>
																		</c:choose>

																		<tr data-index="1">
																			<td class=" "><fmt:formatDate value="${prediction.predictiontime}" pattern="yyyy-MM-dd" /></td>

																			<c:set var="itemid" value="i${prediction.itemid}"></c:set>
																			<td style="" class="text-center">${requestScope[itemid]}</td>
																			<td style="" class="text-center"><i
																				class="${iconpoint}"></i></td>
																			<td style="" class="">${prediction.prediction_comment}</td>
																			<td style="" class="text-center">${prediction.item_value_begining}</td>
																			<td style="" class="text-center">${prediction.item_value_end}</td>
																			<td style="" class="text-center">${prediction.prediction_result}</td>
																			<td style="" class="text-center"><i
																				class="${iconresult}"></i></td>

																		</tr>

																	</c:forEach>


																</tbody>
															</table>
														</div>
														
														
													</div>
												</div>
											</div>
										

									
								</div>

								
							</div>
						</div>
					</div>
				</div>
		


		</c:otherwise>

	</c:choose>







	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<section id="bottom" class="wet-asphalt">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h4>About Us</h4>
				<p>
					Kadir has university computer science graduation project.<br>
					Will it rise or fall project created by:
				</p>
				<ul>
					<li>
						<h5>Arif Selcuk Ogrenci</h5>
					</li>
					<li>
						<h5>Ahmet Tufan Helvaci</h5>
					</li>
					<li>
						<h5>Muhammed Erdem Akkuzu</h5>
					</li>

				</ul>

			</div>
			<!--/.col-md-3-->

			<div class="col-sm-4 ">
				<h4>Address</h4>
				<address>
					<strong>Kadir Has University</strong><br> Cibali, Kadir Has
					Ünv.<br> 34083 Fatih/Istanbul<br>
				</address>


				<form role="form">
					<div class="input-group"></div>
				</form>
			</div>
			<!--/.col-md-3-->
		</div>
	</div>
	</section>
	<!--/#bottom-->

	<footer id="footer" class="midnight-blue">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">&copy; 2017 Athelvaci . All Rights
				Reserved.</div>
			<div class="col-sm-6">
				<ul class="pull-right">
					<li><a href="#">Home</a></li>
					<li><a href="about-us.html">About Us</a></li>
					<li><a href="privacy.html">Privacy Policy</a></li>
					<li><a href="terms.html">Terms of use</a></li>
					<li><a href="contact-us.html">Contact Us</a></li>
					<li><a id="gototop" class="gototop" href="#"><i
							class="icon-chevron-up"></i></a></li>
					<!--#gototop-->
				</ul>
			</div>
		</div>
	</div>
	</footer>
	<!--/#footer-->

	<script src="../resources/js/jquery.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/jquery.prettyPhoto.js"></script>
	<script src="../resources/js/main.js"></script>

</body>
</html>