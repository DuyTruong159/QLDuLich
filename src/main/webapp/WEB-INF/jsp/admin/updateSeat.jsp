<%-- 
    Document   : updateSeat
    Created on : Aug 24, 2021, 6:21:15 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<div class="pd-20 card-box mb-30">
    <div class="clearfix mb-20">
            <div class="pull-left">
                    <h4 class="text-blue h4">Update Seat</h4>
            </div>
    </div>
    <c:url value="/admin/seat/update/${seat.id}" var="action"/>
    <form:form method="post" action="${action}" modelAttribute="seat">
    <div class="form-group">
        <label for="name">Type</label>
        <form:select id="name" path="name" cssClass="form-control">
            <option value="Adults">Adults</option>
            <option value="Childrends">Childrends</option>
        </form:select>
    </div>
    <div class="form-group">
        <label for="price">Price</label>
        <form:input type="text" id="price" path="price" cssClass="form-control"/>
    </div>
    <div class="form-group">
        <label for="tour">Tour</label>
        <form:select id="tour" path="tour" cssClass="form-control">
            <c:forEach var="t" items="${tours}">
                <option value="${t.id}">${t.name}</option>
            </c:forEach>
        </form:select>
    </div>
    <div>
        <input type="submit" value="Update" class="btn btn-primary"/>
    </div>
    </form:form>
</div>
