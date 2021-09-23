<%-- 
    Document   : index
    Created on : Aug 2, 2021, 7:16:31 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<main class="content">
        <div class="slider">
                <ul class="slides">
                        <c:forEach var="t" items="${tourrand}" >
                        <li data-background="<c:url value="${t.image}"/>" 
                            style="background-repeat:no-repeat;background-attachment:fixed;background-size: 100% 100%;">
                                <div class="container">
                                    <div class="slide-caption col-md-4" style="height:60%">
                                                <h2 class="slide-title">${t.name}</h2>
                                                <p>${t.description}</p>
                                        </div>
                                </div>
                        </li>
                        </c:forEach>
                </ul>
                <div class="flexslider-controls" style="padding-top:40px">
                        <div class="container">
                                <ol class="flex-control-nav">
                                        <li><a>1</a></li>
                                        <li><a>2</a></li>
                                        <li><a>3</a></li>
                                </ol>
                        </div>
                </div>
        </div>

        <div class="fullwidth-block features-section">
                <div class="container">
                        <div class="row">
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                        <div class="feature left-icon wow fadeInLeft" data-wow-delay=".3s">
                                                <i class="icon-ticket"></i>
                                                <h3 class="feature-title">Class aptent taciti</h3>
                                                <p>Laborum expedita fugiat et quas quia! Odio dignissimos beatae aspernatur in vero culpa excepturi consequatur!</p>
                                        </div>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                        <div class="feature left-icon wow fadeInLeft">
                                                <i class="icon-plane"></i>
                                                <h3 class="feature-title">Class aptent taciti</h3>
                                                <p>Lectetur recusandae quasi repellendus accusamus ipsa sed quibusdam officia aspernatur natus itaque, asperiores impedit numquam dolorum.</p>
                                        </div>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                        <div class="feature left-icon wow fadeInRight">
                                                <i class="icon-sun"></i>
                                                <h3 class="feature-title">Class aptent taciti</h3>
                                                <p>L culpa ex dolorum ipsa, maxime soluta repudiandae officia corrupti. Doloribus iste voluptatibus nostrum?</p>
                                        </div>
                                </div>
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                        <div class="feature left-icon wow fadeInRight" data-wow-delay=".3s">
                                                <i class="icon-camera"></i>
                                                <h3 class="feature-title">Class aptent taciti</h3>
                                                <p>Lam sit, facere dicta libero ipsa. Repellat deleniti dignissimos, excepturi minima voluptatibus mollitia adipisci iusto.</p>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>

        <div class="fullwidth-block offers-section" data-bg-color="#f1f1f1">
                <div class="container">
                        <h2 class="section-title">The newest holiday offers</h2>
                        <div class="row">
                            <c:forEach var="t" items="${tours}">
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                        <article class="offer wow bounceIn">
                                            <figure class="featured-image img-fluid"><a href="<c:url value="/tour_info/${t.id}"/>"><img src="<c:url value="${t.image}" />" alt="" 
                                                                                    style="width:270px;height:174px"></a></figure>
                                                <h2 class="entry-title text-center" style="height:35px;"><a href="">${t.name}</a></h2>
                                                <span style="display:block;" class="pl-3"><i class="bi bi-calendar3" style="margin-right:15px"></i>${t.date}</span>
                                                <span style="display:block;" class="pl-3"><i class="bi bi-clock-history" style="margin-right:15px;color: blue;"></i>${t.duaration}</span>
                                                <c:choose>
                                                <c:when test="${t.available}">
                                                     <span style="display:block;" class="pl-3"><i class="bi bi-check-circle" style="margin-right:15px;color: green;"></i>Available</span>
                                                </c:when>
                                                <c:otherwise>
                                                     <span style="display:block;" class="pl-3"><i class="bi bi-x-circle" style="margin-right:15px;color: red;"></i>Unavailable</span>
                                                </c:otherwise>
                                                </c:choose>
                                                
                                                     <a class="button" href="<c:url value="/tour_info/${t.id}"/>">See details</a>
                                        </article>
                                </div>
                                </c:forEach>
                        </div>
                        <div class="pagination wow fadeInUp justify-content-center">
                                <c:forEach var="i" begin="1" end="${Math.ceil(counter/8)}">
                                <a href="<c:url value="/"/>?page=${i}" class="page-numbers">${i}</a>
                                </c:forEach>
                        </div>
                </div>
        </div>
        
        <div class="fullwidth-block testimonial-section">
                <div class="container">
                        <h2 class="section-title">Custommers</h2>
                        <div class="row">
                            <c:forEach items="${customer}" var="c">
                                <div class="col-md-3 col-sm-6 col-xs-12">
                                        <div class="testimonial wow fadeInUp h-100">
                                                <figure class="avatar card-img"><img src="<c:url value="${c.user.avatar}" />" alt=""></figure>
                                                <blockquote class="testimonial-body">
                                                        <p>${c.content}</p>
                                                        <cite>${c.user.name}</cite>
                                                        <span>${c.tour.name}</span>
                                                </blockquote>
                                        </div>
                                </div>
                            </c:forEach>
                        </div>
                </div>
        </div>
</main> <!-- .content -->


