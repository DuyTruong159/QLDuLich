<%-- 
    Document   : index
    Created on : Aug 2, 2021, 7:16:31 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title><tiles:insertAttribute name="title" /></title>
		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,700" rel="stylesheet" type="text/css">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
                <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                <link href="<c:url value="/fonts/font-awesome.min.css" />" rel="stylesheet" type="text/css">
		<!-- Loading main css file -->
                <link rel="stylesheet" href="<c:url value="/css/animate.min.css" />">
                <link rel="stylesheet" href="<c:url value="/style.css" />">
                <link rel="stylesheet" href="<c:url value="/tourinfo.css"/>"/>
		
		<!--[if lt IE 9]>
                <script src="<c:url value="/js/ie-support/html5.js" />"></script>
                <script src="<c:url value="/js/ie-support/respond.js" />"></script>
		<![endif]-->
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
                <script src="<c:url value="/tourinfo.js"/>"></script>
	</head>
        
	<body class="slider-collapse">
		
		<div id="site-content">
			
			<header class="site-header wow fadeInDown">
				<div class="container">
                                    <div class="header-content" style="height: 110px">
						<div class="branding">
                                                        <img src="<c:url value="/images/logo.png" />" alt="Company Name" class="logo mr-0">
                                                        <h1 class="site-title"><a href="<c:url value="/" />">My Tour</a></h1>
							<small class="site-description">Travel Relax</small>
						</div>
						
                                                        <nav class="main-navigation" style="width: 75%">
							<button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
							<ul class="menu">
                                                            <li class="menu-item"><a href="<c:url value="/tour" />" style="padding-bottom: 0px">Tour</a></li>
                                                            <li class="menu-item"><a href="<c:url value="customer_protect" />" style="padding-bottom: 0px">Customer Protection</a></li>
                                                            <li class="menu-item"><a href="<c:url value="/contact" />" style="padding-bottom: 0px">Contact</a></li>
                                                            <li class="menu-item"><a href="<c:url value="/about_us" />" style="padding-bottom: 0px">About us</a></li>
                                                            
                                                            <c:choose>
                                                                <c:when test="${pageContext.request.userPrincipal.name==null}">
                                                                    <li class="menu-item float-right"><a href="<c:url value="/login"/>" style="padding-bottom: 0px"><i class="fa fa-sign-in pr-2"></i>Login</a></li>
                                                                    <li class="menu-item float-right"><a href="<c:url value="/register"/>"><i class="fa fa-pencil-square-o pr-2"></i>Register</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <li class="menu-item float-right dropdown">
                                                                        <a class="dropdown-toggle pb-1" href="#" role="button" data-toggle="dropdown">
                                                                            <span class="user-name">${pageContext.request.userPrincipal.name}</span>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list border-0 text-center">
                                                                            <a class="dropdown-item p-1" href="<c:url value="/profile/${pageContext.request.userPrincipal.name}"/>"><i class="fa fa-user pr-2"></i>Profile</a>
                                                                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_STAFF')">
                                                                                <a class="dropdown-item p-1" href="<c:url value="/admin"/>"><i class="fa fa-cogs pr-2"></i>Management</a>
                                                                            </sec:authorize>
                                                                            <a class="dropdown-item p-1" href="<c:url value="/logout"/>"><i class="fa fa-sign-out pr-2"></i>Logout</a>
                                                                        </div>
                                                                    </li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                       </ul>
						</nav>
						

					</div>
				</div>
			</header> <!-- .site-header -->

                        <!-- main -->
                        <tiles:insertAttribute name="content" />

			<footer class="site-footer wow fadeInUp">
				<div class="footer-top">
					<div class="container">
						<div class="row">
							<div class="col-md-3 col-sm-6">
								<div class="widget">
									<h3 class="widget-title">About us</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus animi asperiores magnam ducimus laboriosam soluta, odio doloribus, voluptas numquam facilis consectetur nam in repudiandae commodi odit iste sed doloremque repellat.</p>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="widget">
									<h3 class="widget-title">Helpful Links</h3>
									<ul class="list-arrow">
										<li><a href="#">Labore et dolore magnam</a></li>
										<li><a href="#">Dolore magnam</a></li>
										<li><a href="#">Magnam Labore et</a></li>
										<li><a href="#">Dolore mabore magnam</a></li>
										<li><a href="#">Et dolore magnam</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="widget">
									<h3 class="widget-title">Helpful Links</h3>
									<ul class="list-arrow">
										<li><a href="#">Labore et dolore magnam</a></li>
										<li><a href="#">Dolore magnam</a></li>
										<li><a href="#">Magnam Labore et</a></li>
										<li><a href="#">Dolore mabore magnam</a></li>
										<li><a href="#">Et dolore magnam</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="widget widget-customer-info">
									<h3 class="widget-title">Customer Service</h3>
                                                                        <div class="cs-info">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim voluptates pariatur vero.</p>
										<p>+1 421 458 321 <br> <a href="mailto:cs@companyname.com">pj@ou.edu.vn</a></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer-bottom">
					<div class="container">
						<div class="branding pull-left">
                                                        <img src="<c:url value="/images/logo-footer.png" />" alt="Company Name" class="logo">
							<h1 class="site-title"><a href="index.html">My Tour</a></h1>
							<small class="site-description">Travel Relax</small>
						</div>

						<div class="contact-links pull-right">
							<a href="https://goo.gl/maps/oQKxg"><i class="fa fa-map-marker"></i> Võ Văn Tần, Gò Vấp</a>
							<a href="tel:+134453455345"><i class="fa fa-phone"></i> +1 344 5345 5345</a>
							<a href="mailto:contact@companyname.com"><i class="fa fa-envelope"></i> pj@ou.edu.vn</a>
						</div>
					</div>
				</div>
				<div class="colophon">
					<div class="container">
						<p class="copy">Copyright 2021 My Tour, Designed by DTR, All right reserved.</p>
					</div>
				</div>
			</footer> <!-- .site-footer -->

		</div> <!-- #site-content -->
                <script src="<c:url value="/js/jquery-1.11.1.min.js" />"></script>
                <script src="<c:url value="/js/min/plugins-min.js" />"></script>
                <script src="<c:url value="/js/min/app-min.js" />"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</body>

</html>
