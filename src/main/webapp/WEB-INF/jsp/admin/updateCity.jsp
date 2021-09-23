<%-- 
    Document   : updateCity
    Created on : Aug 24, 2021, 2:48:57 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<div class="pd-20 card-box mb-30">
    <div class="clearfix mb-20">
            <div class="pull-left">
                    <h4 class="text-blue h4">Update City</h4>
            </div>
    </div>
    <c:url value="/admin/city/update/${city.id}" var="action"/>
    <form:form method="post" action="${action}" modelAttribute="city">
    <div class="form-group">
        <label for="name">Name</label>
        <form:input type="text" id="name" path="name" cssClass="form-control"/>
    </div>
    <div>
        <input type="submit" value="Update" class="btn btn-primary"/>
    </div>   
    </form:form>  
</div>

