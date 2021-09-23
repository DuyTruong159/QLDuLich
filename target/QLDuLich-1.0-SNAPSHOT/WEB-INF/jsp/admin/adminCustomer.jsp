<%-- 
    Document   : adminCustomer
    Created on : Aug 30, 2021, 11:15:00 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
                <div class="card-box mb-30">
                        <div class="pd-20">
                                <h4 class="text-blue h4">Customers</h4>
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
                                                        <th class="table-plus datatable-nosort">Avatar</th>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Birthday</th>
                                                        <th>Sex</th>
                                                        <th>Phone</th>
                                                        <th>Username</th>
                                                        <th class="datatable-nosort">Active</th>
                                                        <th class="datatable-nosort">Password</th>
                                                        <th class="datatable-nosort">Managements</th>
                                                </tr>
                                        </thead>
                                        <tbody>
                                                <c:forEach items="${customer}" var="c">
                                                <tr>
                                                        <td class="table-plus">
                                                            <img src="<c:url value="${c.avatar}" />" width="70" height="70" alt="">
                                                        </td>
                                                        <td>
                                                                <h5 class="font-16">${c.name}</h5>
                                                        </td>
                                                        <td>${c.email}</td>
                                                        <td>${c.birthday}</td>
                                                        <td>${c.sex}</td>
                                                        <td>${c.phone}</td>
                                                        <td>${c.username}</td>
                                                        <c:choose>
                                                        <c:when test="${c.active}">
                                                            <td><i class="bi bi-check-circle-fill" style="color: green"></i></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><i class="bi bi-x-circle" style="color: red"></i></td>
                                                        </c:otherwise>
                                                        </c:choose>
                                                        <td>${c.password}</td>
                                                        <td>
                                                                <div class="dropdown">
                                                                        <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                                                                <i class="dw dw-more"></i>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                                                                <a class="dropdown-item" href="<c:url value="/admin/customer/update/${c.id}"/>"><i class="dw dw-edit2"></i> Update</a>
                                                                                <a class="dropdown-item" href="<c:url value="/admin/customer/delete/${c.id}"/>" onclick="return confirm('Are you sure?')">
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
                                    <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                                    <li class="page-item"><a class="page-link" href="<c:url value="/admin/customer"/>?page=${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                </div>

        </div>

</div>
