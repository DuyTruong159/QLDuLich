<%-- 
    Document   : updateStaff
    Created on : Aug 30, 2021, 7:35:55 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<div class="pd-20 card-box mb-30">
    <div class="clearfix mb-20">
            <div class="pull-left">
                    <h4 class="text-blue h4">Update Staff</h4>
            </div>
    </div>

    <c:url value="/admin/staff/update/${user.id}" var="action" />
    <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
        <form:errors path="*" cssClass="alert alert-danger" element="div"/>
            <div class="form-group">
                    <label for="name">Name</label>
                    <form:input type="text" id="name" path="name" cssClass="form-control"/>
            </div>
            <div class="form-group">
                    <label for="file">Avatar</label>
                    <form:input type="file" id="file" path="file" cssClass="form-control col-md-6"/>
            </div>
            <div class="form-group">
                <lable for="email">Email</lable>
                <form:input type="email" id="email" path="email" cssClass="form-control"/>
            </div>
            <div class="form-group">
                    <label for="birthday">Birthday</label>
                    <form:input type="date" id="birthday" path="birthday" cssClass="form-control"/>
            </div>
            <div class="form-group">
                    <label for="phone">phone</label>
                    <form:input type="text" id="phone" path="phone" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <label for="sex">Sex</label>
                <form:select id="sex" path="sex" cssClass="form-control">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </form:select>
            </div>
            <div class="form-group">
                    <label for="username">Username</label>
                    <form:input type="text" id="username" path="username" cssClass="form-control"/>
            </div>
            <div class="form-group">
                    <label for="password">Password</label>
                    <form:input type="password" id="password" path="password" cssClass="form-control"/>
            </div>
            <div class="form-group">
                    <label for="active">Active</label>
                    <form:checkbox checked="checked" id="active" path="active"/>
            </div>
            <div hidden>
                    <form:input type="text" id="pass" path="pass" cssClass="form-control"/>
            </div>
            <div>
                <input type="submit" value="Update" class="btn btn-primary"/>
            </div>
    </form:form>
</div>

