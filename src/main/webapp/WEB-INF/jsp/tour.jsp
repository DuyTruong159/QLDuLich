<%-- 
    Document   : tour
    Created on : Aug 2, 2021, 9:50:37 PM
    Author     : duytruong
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<main class="content" style="margin-top:60px;">
        <div class="fullwidth-block">
                <div class="container">
                        <div class="filter-links filterable-nav">
                                <select class="mobile-filter">
                                        <option value="*">Show all</option>
                                        <option value=".south-america">South America</option>
                                        <option value=".asia">Asia</option>
                                        <option value=".africa">Africa</option>
                                        <option value=".north-america">North America</option>
                                        <option value=".europe">Europe</option>
                                        <option value=".australia">Australia</option>	
                                </select>
                                <a href="#" class=" current wow fadeInRight" data-filter="*">Show all</a>
                                <a href="#" class="wow fadeInRight" data-wow-delay=".2s" data-filter=".south-america">Boat</a>
                                <a href="#" class="wow fadeInRight" data-wow-delay=".4s" data-filter=".asia">Mountains</a>
                                <a href="#" class="wow fadeInRight" data-wow-delay=".6s" data-filter=".africa">Climbing</a>
                                <a href="#" class="wow fadeInRight" data-wow-delay=".8s" data-filter=".north-america">Valley</a>
                        </div>
                        
                    <form action="">
                        <div class="row pb-5">
                            <div class="col-md-11">
                                <input class="form-control" name="kw" type="text" placeholder="Nhập từ tìm kiếm ..."/>
                            </div>
                            <div>
                                <input type="submit" value="Search" class="btn btn-primary"/>
                            </div>
                        </div>
                    </form>
                    
                        <div class="filterable-items">
                                <c:forEach var="p" items="${tours}">
                                    <c:forEach var="ht" items="${p.tag}">
                                       <div class="filterable-item ${ht.htmlTag} ">
                                            <article class="offer-item">
                                                    <figure class="featured-image">
                                                        <a href="<c:url value="/tour_info/${p.id}"/>">
                                                            <img src="<c:url value="${p.image}"/>" alt="" width="118" height="210"></a>
                                                    </figure>
                                                    <h2  class="entry-title"><a href="<c:url value="/tour_info/${p.id}"/>">${p.name}</a></h2>
                                                    <p>${p.description}</p>
                                                    <c:forEach items="${seats}" var="s">
                                                        <c:if test="${s.tour.id == p.id}">
                                                            <c:choose>
                                                                <c:when test="${s.name == Adults}">
                                                                    <div class="price pl-2">
                                                                        <strong>${s.price}</strong>
                                                                        <small>/${s.name}</small>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="price pl-2">
                                                                        <strong>${s.price} USD</strong>
                                                                        <small>/${s.name}</small>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:forEach>
                                            </article>
                                    </div>
                                    </c:forEach>
                                </c:forEach>
                        </div>

                        <div class="pagination wow fadeInUp">
                                <c:forEach var="i" begin="1" end="${Math.ceil(counter/15)}">
                                <a href="<c:url value="/tour"/>?page=${i}" class="page-numbers">${i}</a>
                                </c:forEach>
                        </div>

                </div>

        </div>


</main> <!-- .content -->

