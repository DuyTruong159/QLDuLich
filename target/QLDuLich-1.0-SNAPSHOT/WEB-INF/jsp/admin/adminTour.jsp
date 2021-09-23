<%-- 
    Document   : adminTour
    Created on : Aug 20, 2021, 12:47:19 AM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
                <div class="card-box mb-30">
                        <div class="pd-20">
                                <h4 class="text-blue h4">Tour</h4>
                        </div>
                    
                        <form action="" class="form-group">
                            <div class="row pb-5">
                                <div class="col-md-11">
                                    <input class="form-control" name="kw" type="text" placeholder="Nhập từ tìm kiếm ..."/>
                                </div>
                                <div>
                                    <input type="submit" value="Search" class="btn btn-primary"/>
                                </div>
                            </div>
                        </form>
                    
                        <div class="pb-20">
                                <table class="data-table table hover nowrap">
                                        <thead>
                                                <tr>
                                                        <th class="table-plus datatable-nosort">Tours</th>
                                                        <th>Name</th>
                                                        <th>City</th>
                                                        <th>Date</th>
                                                        <th>Duaration</th>
                                                        <th>Available</th>
                                                        <th class="datatable-nosort">Description</th>
                                                        <th class="datatable-nosort">Seats</th>
                                                        <th class="datatable-nosort">Stocks</th>
                                                        <th class="datatable-nosort">Managements</th>
                                                </tr>
                                        </thead>
                                        <tbody>
                                                <c:forEach items="${tours}" var="t">
                                                <tr>
                                                        <td class="table-plus">
                                                            <img src="<c:url value="${t.image}" />" width="70" height="70" alt="">
                                                        </td>
                                                        <td>
                                                                <h5 class="font-16">${t.name}</h5>
                                                        </td>
                                                        <td>${t.city.name}</td>
                                                        <td>${t.date}</td>
                                                        <td>${t.duaration}</td>
                                                        <c:choose>
                                                        <c:when test="${t.available}">
                                                            <td><i class="bi bi-check-circle-fill" style="color: green"></i></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><i class="bi bi-x-circle" style="color: red"></i></td>
                                                        </c:otherwise>
                                                        </c:choose>
                                                            <td>${t.description}</td>
                                                        <td>
                                                        <c:forEach items="${seats}" var="s">
                                                            <c:if test="${s.tour.id == t.id}">
                                                                <c:choose>
                                                                    <c:when test="${s.name == Adults}">
                                                                        <div>
                                                                            <a>${s.name}: </a>
                                                                            <a>${s.price} USD</a>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div>
                                                                            <a>${s.name}: </a>
                                                                            <a>${s.price} USD</a>
                                                                        </div>
                                                                   </c:otherwise>
                                                                </c:choose>
                                                            </c:if>
                                                        </c:forEach>
                                                        </td>
                                                        <td>${t.stock}/50</td>
                                                        <td>
                                                                <div class="dropdown">
                                                                        <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                                                                <i class="dw dw-more"></i>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                                                                <a class="dropdown-item" href="<c:url value="/admin/tour/update/${t.id}"/>"><i class="dw dw-edit2"></i> Update</a>
                                                                                <a class="dropdown-item" href="<c:url value="/admin/tour/delete/${t.id}"/>" onclick="return confirm('Are you sure?')">
                                                                                    <i class="dw dw-delete-3"></i> Delete</a>
                                                                        </div>
                                                                </div>
                                                        </td>
                                                </tr>
                                                </c:forEach>
                                        </tbody>
                                </table>
                        </div>
                        <div class="pb-3 ml-5">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:forEach begin="1" end="${Math.ceil(counter/15)}" var="i">
                                    <li class="page-item"><a class="page-link" href="<c:url value="/admin/tour"/>?page=${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                </div>

        </div>

</div>
