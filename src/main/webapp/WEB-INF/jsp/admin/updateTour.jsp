<%-- 
    Document   : updateTour
    Created on : Aug 24, 2021, 6:35:53 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<div class="pd-20 card-box mb-30">
    <div class="clearfix mb-20">
            <div class="pull-left">
                    <h4 class="text-blue h4">Update Tour</h4>
            </div>
    </div>
    <c:url value="/admin/tour/update/${tour.id}" var="action" />
    <form:form method="post" action="${action}" modelAttribute="tour" enctype="multipart/form-data">
        <form:errors path="*" cssClass="alert alert-danger" element="div"/>
            <div class="form-group">
                    <label for="name">Name</label>
                    <form:input type="text" id="name" path="name" cssClass="form-control"/>
                    <form:errors path="name" cssClass="text-danger" element="div"/>
            </div>
            <div class="form-group">
                    <label for="city">City</label>
                    <form:select id="city" path="city" cssClass="form-control">
                        <c:forEach var="c" items="${city}">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </form:select>
            <div class="form-group">
                    <label for="file">Image</label>
                    <form:input type="file" id="file" path="file" cssClass="form-control col-md-6"/>
            </div>
            <div class="form-group">
                <lable for="date">Date Start</lable>
                <form:input type="date" id="date" path="date" cssClass="form-control"/>
            </div>
            <div class="form-group">
                    <label for="description">Description</label>
                    <form:textarea type="text" id="description" path="description" cssClass="form-control"/>
            </div>
            <div class="form-group">
                    <label for="duaration">Duaration</label>
                    <form:input type="text" id="duaration" path="duaration" cssClass="form-control col-md-3"/>
            </div>
            <div class="form-group">
                    <label for="stock">Stock</label>
                    <form:input type="text" id="stock" path="stock" cssClass="form-control col-md-2" />
            </div>
            <div class="form-group">
                    <label for="available">Available</label>
                    <form:checkbox checked="checked" id="available" path="available"/>
            </div>
            <div>
                <input type="submit" value="Update" class="btn btn-primary"/>
            </div>
    </form:form>
</div>
