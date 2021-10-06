<%-- 
    Document   : adminsite
    Created on : Aug 8, 2021, 3:25:54 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pd-ltr-20">
            <div class="card-box pd-20 height-100-p mb-30">
                    <div class="row align-items-center">
                            <div class="col-md-4">
                                <img src="<c:url value="/admin/vendors/images/banner-img.png" />" alt="">
                            </div>
                            <div class="col-md-8">
                                    <h4 class="font-20 weight-500 mb-10 text-capitalize">
                                            Welcome back <div class="weight-600 font-30 text-blue">${pageContext.request.userPrincipal.name}</div>
                                    </h4>
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-xl-3 mb-30">
                            <div class="card-box height-100-p widget-style1">
                                    <div class="d-flex flex-wrap align-items-center">
                                            <div class="progress-data">
                                                    <div id="chart"></div>
                                            </div>
                                            <div class="widget-data">
                                                    <div class="h4 mb-0">${user.size()}</div>
                                                    <div class="weight-600 font-14">Users</div>
                                            </div>
                                    </div>
                            </div>
                    </div>
                    <div class="col-xl-3 mb-30">
                            <div class="card-box height-100-p widget-style1">
                                    <div class="d-flex flex-wrap align-items-center">
                                            <div class="progress-data">
                                                    <div id="chart2"></div>
                                            </div>
                                            <div class="widget-data">
                                                    <div class="h4 mb-0">400</div>
                                                    <div class="weight-600 font-14">Booking</div>
                                            </div>
                                    </div>
                            </div>
                    </div>
                    <div class="col-xl-3 mb-30">
                            <div class="card-box height-100-p widget-style1">
                                    <div class="d-flex flex-wrap align-items-center">
                                            <div class="progress-data">
                                                    <div id="chart3"></div>
                                            </div>
                                            <div class="widget-data">
                                                    <div class="h4 mb-0">${counter}</div>
                                                    <div class="weight-600 font-14">Tours</div>
                                            </div>
                                    </div>
                            </div>
                    </div>
                    <div class="col-xl-3 mb-30">
                            <div class="card-box height-100-p widget-style1">
                                    <div class="d-flex flex-wrap align-items-center">
                                            <div class="progress-data">
                                                    <div id="chart4"></div>
                                            </div>
                                            <div class="widget-data">
                                                    <div class="h4 mb-0">$6060</div>
                                                    <div class="weight-600 font-14">Cost</div>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-xl-8 mb-30">
                            <div class="card-box height-100-p pd-20">
                                    <h2 class="h4 mb-20">Activity</h2>
                                    <div id="chart5"></div>
                            </div>
                    </div>
                    <div class="col-xl-4 mb-30">
                            <div class="card-box height-100-p pd-20">
                                    <h2 class="h4 mb-20">Lead Target</h2>
                                     <div id="chart6"></div>
                            </div>
                    </div>
            </div>
            <div class="card-box mb-30">
                    <h2 class="h4 pd-20">All Tours</h2>
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
                    
                    <table class="data-table table nowrap">
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
                                                            <a class="dropdown-item" href="<c:url value="/admin/tour/update/${t.id}"/>"><i class="dw dw-edit2"></i>Update</a>
                                                            <a class="dropdown-item" href="<c:url value="/admin/tour/delete/${t.id}"/>"><i class="dw dw-delete-3"></i> Delete</a>
                                                        </div>
                                                </div>
                                            </td>
                                    </tr>
                                    </c:forEach>
                            </tbody>
                    </table>
                    <div class="pb-3 ml-5">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:forEach begin="1" end="${Math.ceil(counter/15)}" var="i">
                                <li class="page-item"><a class="page-link" href="<c:url value="/admin"/>?page=${i}">${i}</a></li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
            </div>
    </div>
                                                    
   
                              
                                                   