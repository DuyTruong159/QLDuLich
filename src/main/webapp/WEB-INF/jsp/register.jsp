<%-- 
    Document   : register
    Created on : Aug 26, 2021, 5:37:37 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>

<c:url var="action" value="/register"/>
<form:form method="post" modelAttribute="user" action="${action}" enctype="multipart/form-data">
    <form:errors path="*" cssClass="alert alert-danger" element="ul"/>
        <div class="form-group">
            <form:input type="text" id="name" path="name" cssClass="form-control" placeholder="Name"/>
        </div>
        <div class="form-group">
            <form:input type="file" id="file" path="file" cssClass="form-control"/>
        </div>
        <div class="form-group">
            <form:input type="email" id="email" path="email" cssClass="form-control" placeholder="Email"/>
        </div>
        <div class="form-group">
            <form:input type="date" id="birthday" path="birthday" cssClass="form-control" placeholder="Birthday"/>
        </div>
        <div class="form-group">
            <form:input type="text" id="phone" path="phone" cssClass="form-control" placeholder="phone"/>
        </div
        <div class="form-group">
            <form:select id="sex" path="sex" cssClass="form-control">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </form:select>
                <br/>
        </div>
        <div class="form-group">
            <form:input type="text" id="username" path="username" cssClass="form-control" placeholder="Username"/>
        </div>
        <div class="form-group">
            <form:input type="password" id="password-field" path="password" cssClass="form-control" placeholder="Password"/>
            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
        </div>
        <div class="form-group">
            <form:input type="password" id="confirmPassword" path="confirmPassword" cssClass="form-control" placeholder="Confirm Password"/>
        </div>
        <div class="form-group">
            <button type="submit" class="form-control btn btn-primary submit px-3">Register</button>
        </div>
</form:form>
                                    

    
