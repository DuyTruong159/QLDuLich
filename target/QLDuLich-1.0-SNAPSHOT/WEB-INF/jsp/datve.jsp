<%-- 
    Document   : tourinfo
    Created on : Aug 6, 2021, 2:40:47 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />

<link rel="stylesheet" href="<c:url value="/bootstrapdetails.css" />" >

<main class="content">
    <div class="fullwidth-block" style="padding: 100px 0px 0px 0px">
            <div class="container" style="padding: 0px">
                <div class="col-sm-12 col-md-12 col-lg-12" style="margin: 0px">
                    <!-- product -->
                    <c:forEach var="t" items="${tours}">
                    <div class="product-content product-wrap clearfix product-deatil pb-5">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="pro-img-details">
                                    <img src="<c:url value="${t.image}"/>" alt="" width="550px" height="350px">
                                </div>
                            </div>

                            <div class="col-md-6 col-md-offset-1 col-sm-12 col-xs-12 pl-5">
                                 <h2 class="name">
                                    ${t.name}
                                </h2>
                                <form>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="date">Ngày đi</label>
                                            <input type="text" class="form-control-plaintext" id="date" readonly value="${t.date}">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="duaration">Duaration</label>
                                            <input type="text" class="form-control-plaintext" id="duaration" readonly value="${t.duaration}">
                                        </div>
                                    </div>   
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="type">Loại vé</label>
                                            <input type="text" class="form-control-plaintext" id="type" readonly value="${seats.name}">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="price">Price</label>
                                            <input type="text" class="form-control-plaintext" id="price" readonly value="${seats.price} USD">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="quantity">Quantity</label>
                                        <input type="number" class="form-control" id="quantity" placeholder="Quantity">
                                    </div>
                                        <button type="button" class="btn btn-primary pull-right" onclick="addTicket(${t.id},${seats.id})">Đặt vé</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- end product -->
                </div>
            </div>
    </div>
</main> <!-- .content -->
