<%-- 
    Document   : adminTag
    Created on : Aug 23, 2021, 10:09:05 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<div class="pd-20 card-box mb-30">
    <div class="clearfix mb-20">
            <div class="pull-left">
                    <h4 class="text-blue h4">Tag</h4>
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
                    <c:forEach var="t" varStatus="status" items="${tags}">
                    <tr>
                            <th scope="row">${status.count}</th>
                            <td>${t.name}</td>
                            <td>
                                <c:forEach var="tt" items="${t.tour}">
                                    ${tt.name}
                                    </br>
                                </c:forEach>
                            </td>
                            <td>
                                    <div class="dropdown">
                                            <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                                    <i class="dw dw-more"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                                    <a class="dropdown-item" href="<c:url value="/admin/tag/update/${t.id}"/>"><i class="dw dw-edit2"></i> Update</a>
                                                    <a class="dropdown-item" href="<c:url value="/admin/tag/delete/${t.id}"/>" onclick="return confirm('Are you sure?')">
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
                <li class="page-item"><a class="page-link" href="<c:url value="/admin/tag"/>?page=${i}">${i}</a></li>
                </c:forEach>
            </ul>
        </nav>
    </div>
</div>
