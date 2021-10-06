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
                                    <small>Tag:  
                                        <c:forEach var="tag" items="${t.tag}">
                                                <a href="javascript:void(0);">${tag.name}</a>
                                        </c:forEach>
                                    </small>
                                    <c:forEach items="${commentTour}" var="ct">
                                    <a id="rateAvg">${Math.round(ct[1])}</a>
                                    <a class="h6" href="javascript:void(0);">${ct[0]} Customer Comments</a>
                                    </c:forEach>
                                </h2>
                                <hr />
                                <div class="certified">
                                    <ul class="row ml-2">
                                        <c:forEach var="s" items="${seats}">
                                            <c:if test="${s.tour.id == t.id}">
                                                <c:choose>
                                                    <c:when test="${s.name == Adults}">
                                                        <li class="col-md-6">
                                                            <a href="<c:url value="/datve/${t.id}/${s.id}"/>"><p class="h3 text-center">${s.name}</p><span><p class="h4">${s.price} USD</span></p></a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="col-md-6">
                                                            <a href="<c:url value="/datve/${t.id}/${s.id}"/>"><p class="h3 text-center">${s.name}</p><span><p class="h4">${s.price} USD</span></p></a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <hr />
                                <div class="description description-tabs">
                                    <ul id="myTab" class="nav nav-pills">
                                        <li class="active btn"><a href="#more-information" data-toggle="tab" class="no-margin">Tour Description </a></li>
                                        <li class="btn"><a href="#specifications" data-toggle="tab">Specifications</a></li>
                                        <li class="btn"><a href="#reviews" data-toggle="tab">Reviews</a></li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </div>
                        <div id="myTabContent" class="tab-content mt-3" style="height: 250px">
                            <div class="tab-pane fade active in" id="more-information" style="overflow: scroll; height: 100%">
                                <strong class="pl-3">Description</strong>
                                <p>
                                    ${t.description}
                                </p>
                            </div>
                            <div class="tab-pane fade" id="specifications" style="overflow: scroll; height: 100%">
                                <dl class="">
                                    <dt class="pl-3">Date</dt>
                                    <dd><i class="bi bi-calendar3" style="margin-right:15px"></i>${t.date}</dd>

                                    <dt class="pl-3">Duaration</dt>
                                    <dd><i class="bi bi-clock-history" style="margin-right:15px;color: blue;"></i>${t.duaration}</dd>

                                    <dt class="pl-3">Stock</dt>
                                    <c:choose>
                                    <c:when test="${t.available}">
                                    <dd><i class="bi bi-check-circle" style="margin-right:15px;color: green;"></i>Available</dd>
                                    </c:when>
                                    <c:otherwise>
                                    <dd><i class="bi bi-x-circle" style="margin-right:15px;color: red;"></i>Unavailable</dd>
                                    </c:otherwise>
                                    </c:choose>
                                </dl>
                            </div>
                            <div class="tab-pane fade" id="reviews" style="overflow: scroll; height: 100%">
                                <form class="well padding-bottom-10">
                                    <textarea rows="2" class="form-control" id="comment" placeholder="Write a review"></textarea>
                                    <div class="mt-1">
                                        <button type="button" class="btn btn-sm btn-primary pull-right mr-2" onclick="addComment(${t.id})">
                                            Post
                                        </button>
                                        <div class="rating pull-left">
                                            <input type="radio" id="star5" name="rating" value="5" />
                                            <label class="full" for="star5"></label> 
                                            <input type="radio" id="star4" name="rating" value="4" />
                                            <label class="full" for="star4"></label> 
                                            <input type="radio" id="star3" name="rating" value="3" />
                                            <label class="full" for="star3"></label>
                                            <input type="radio" id="star2" name="rating" value="2" />
                                            <label class="full" for="star2"></label>
                                            <input type="radio" id="star1" name="rating" value="1" />
                                            <label class="full" for="star1"></label> 
                                            <input type="radio" id="start0" name="rating" value="0" checked/> 
                                        </div>
                                    </div>
                                </form>
                                <div class="chat-body no-padding profile-message mt-5" id="commentArea">
                                    <c:forEach items="${t.comment}" var="comment">
                                    <div class="p-3 mb-3 bg-light rounded-lg">
                                        <div class="message row pb-2">
                                            <div class="col-md-12">
                                                <img src="<c:url value="${comment.user.avatar}"/>" class="online" />
                                                <a href="javascript:void(0);" class="h5 pl-3">
                                                    ${comment.user.name}
                                                </a>
                                                <div class="pull-right" id="rate">
                                                    ${comment.rate}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row pb-2">
                                            <div class="col-md-12 text-break h6">
                                                ${comment.content}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <small class="text-muted pull-right ultra-light"> ${comment.createdDate} </small>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- end product -->
                </div>
            </div>
    </div>
</main> <!-- .content -->
