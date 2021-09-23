<%-- 
    Document   : adminCity
    Created on : Aug 20, 2021, 3:09:13 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<div class="pd-20 card-box mb-30">
    <div class="clearfix mb-20">
            <div class="pull-left">
                    <h4 class="text-blue h4">City</h4>
            </div>
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
    
    <table class="table table-striped">
            <thead>
                    <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Tour</th>
                            <th scope="col">Managements</th>
                    </tr>
            </thead>
            <tbody>
                    <c:forEach var="c" varStatus="status" items="${city}">
                    <tr>
                            <th scope="row">${status.count}</th>
                            <td>${c.name}</td>
                            <td>
                                <c:forEach var="t" items="${tours}">
                                    <c:if test="${t.city.id == c.id}">
                                        <span>${t.name}</span>
                                        <br/>
                                    </c:if> 
                                </c:forEach>
                            </td>
                            <td>
                                    <div class="dropdown">
                                            <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                                    <i class="dw dw-more"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                                    <a class="dropdown-item" href="<c:url value="/admin/city/update/${c.id}"/>"><i class="dw dw-edit2"></i> Update</a>
                                                    <a class="dropdown-item" href="<c:url value="/admin/city/delete/${c.id}"/>" onclick="return confirm('Are you sure?')">
                                                        <i class="dw dw-delete-3"></i> Delete</a>
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
                <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                <li class="page-item"><a class="page-link" href="<c:url value="/admin/city"/>?page=${i}">${i}</a></li>
                </c:forEach>
            </ul>
        </nav>
    </div>
</div>
