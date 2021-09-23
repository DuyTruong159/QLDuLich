<%-- 
    Document   : register
    Created on : Aug 26, 2021, 5:37:37 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!doctype html>
<html lang="en">
  <head>
  	<title><tiles:insertAttribute name="title" /></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="/login/css/style.css"/>">

</head>
<body class="img js-fullheight" style="background-image: url(<c:url value="/login/images/login.jpeg"/>);">
    <section class="ftco-section pb-0 pt-4">
            <div class="container">
                    <div class="row justify-content-center">
                            <div class="col-md-6 text-center mb-3">
                                    <h2 class="heading-section"><tiles:insertAttribute name="header" /></h2>
                            </div>
                    </div>
                    <div class="row justify-content-center">
                            <div class="col-md-6 col-lg-4">
                                    <div class="login-wrap p-0">
                                        <tiles:insertAttribute name="content" />
                                    </div>
                            </div>
                    </div>
            </div>
    </section>

<script src="<c:url value="/login/js/jquery.min.js"/>"></script>
<script src="<c:url value="/login/js/popper.js"/>"></script>
<script src="<c:url value="/login/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/login/js/main.js"/>"></script>

</body>
</html>


    

