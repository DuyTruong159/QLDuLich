<%-- 
    Document   : login
    Created on : Aug 26, 2021, 10:25:57 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.error != null}">
    <div class="alert alert-danger">
        Password hoặc Username không đúng
    </div>
</c:if>

<c:if test="${param.accessDenied != null}">
    <div class="alert alert-danger">
        Bạn không có quyền truy cập
    </div>
</c:if>

<c:url value="/login" var="action"/>
<form method="post" action="${action}" class="signin-form">
    <div class="form-group">
        <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
    </div>
    <div class="form-group">
        <input id="password-field" type="password" name="password" class="form-control" placeholder="Password" required>
      <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
    </div>
    <div class="form-group">
        <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
    </div>
    <div class="form-group">
        <button type="button" onclick="location.href='<c:url value="/register"/>'" class="form-control btn btn-primary submit px-3">You Don't Have Account ??</button>
    </div>
</form>
<p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
<div class="social d-flex text-center">
    <a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
    <a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Twitter</a>
</div>