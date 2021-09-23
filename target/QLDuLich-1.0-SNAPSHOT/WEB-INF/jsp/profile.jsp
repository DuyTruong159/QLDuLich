<%-- 
    Document   : profile
    Created on : Aug 29, 2021, 1:03:06 AM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<div class="container target mt-3">
    <c:if test="${errMsg != null}">
        <div class="alert alert-danger">
            ${errMsg}
        </div>
    </c:if>
    <div class="row">
        <div class="col-sm-10">
            <h1>${u.name}</h1>
            <a class="btn btn-warning text-white" href="<c:url value="/"/>">Return to Home</a> 
            <button type="button" class="btn btn-warning text-white" data-toggle="modal" data-target="#changePass">
                Change Password
            </button>
        <br>
        </div>
        <div class="col-sm-2"><img title="profile image" class="img-fluid rounded-circle" src="<c:url value="${u.avatar}"/>"></div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-3">
            <!--left col-->
            <ul class="list-group">
                <li class="list-group-item text-muted" contenteditable="false">Profile</li>
                <li class="list-group-item text-left"><span class="pull-left"><strong class="">Name: </strong></span> ${u.name}</li>
                <li class="list-group-item text-left"><span class="pull-left"><strong class="">Email: </strong></span> ${u.email}</li>
                <li class="list-group-item text-left"><span class="pull-left"><strong class="">Birthday: </strong></span>${u.birthday}</li>
                <li class="list-group-item text-left"><span class="pull-left"><strong class="">Sex: </strong></span>${u.sex}</li>
                <li class="list-group-item text-muted" contenteditable="false">Contact Details</li>
                <li class="list-group-item text-left"><span class="pull-left"><strong class="">Telephone Number: </strong></span>${u.phone}</li>
            </ul>
            
        </div>
        <div class="col">
            <h2 class="ml-3">Tours Paid</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Date</th>
                            <th scope="col">Duaration</th>
                            <th scope="col">Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>cell</td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>


<div class="modal fade" id="changePass">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Đổi mật khẩu</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <c:url value="/profile/${pageContext.request.userPrincipal.name}" var="action"/>
            <form method="post" action="${action}">
            <div class="modal-body">
                <div class="form-group">
                    <input type="text" class="form-control" name="passOld" placeholder="Mật khẩu cũ" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="passNew" placeholder="Mật khẩu mới" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="passConfirm" placeholder="Xác nhận mật khẩu mới" required>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </form>
        </div>
    </div>
</div>
