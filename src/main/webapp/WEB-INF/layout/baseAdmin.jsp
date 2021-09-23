<%-- 
    Document   : adminsite
    Created on : Aug 8, 2021, 3:25:54 PM
    Author     : duytruong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title><tiles:insertAttribute name="title" /></title>

	<!-- Site favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="<c:url value="/admin/vendors/images/apple-touch-icon.png" />">
        <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/admin/vendors/images/favicon-32x32.png" />">
        <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/admin/vendors/images/favicon-16x16.png" />">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/admin/vendors/styles/core.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/admin/vendors/styles/icon-font.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/admin/src/plugins/datatables/css/dataTables.bootstrap4.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/admin/src/plugins/datatables/css/responsive.bootstrap4.min.css" />">
        <link rel="stylesheet" type="text/css" href="<c:url value="/admin/vendors/styles/style.css" />">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
        <style>
            body {
                background-color: #ecf0f4;
            }
        </style>
</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
                    <div class="loader-logo"><img src="<c:url value="/admin/vendors/images/deskapp-logo.png" />" alt=""></div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">
				Loading...
			</div>
		</div>
	</div>

	<div class="header">
		<div class="header-left">
			<div class="menu-icon dw dw-menu"></div>
			<div class="search-toggle-icon dw dw-search2" data-toggle="header_search"></div>
			<div class="header-search"></div>
		</div>
		<div class="header-right">
			<div class="dashboard-setting user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="javascript:;" data-toggle="right-sidebar">
						<i class="dw dw-settings2"></i>
					</a>
				</div>
			</div>
			<div class="user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="#" role="button" data-toggle="dropdown">
						<i class="icon-copy dw dw-notification"></i>
						<span class="badge notification-active"></span>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="notification-list mx-h-350 customscroll">
							<ul>
                                                            <c:forEach items="${messenger}" var="m">
								<li>
									<a href="#">
                                                                            <img src="<c:url value="${m.user.avatar}" />" alt="">
										<h3>${m.user.name}</h3>
										<p>${m.content}</p>
									</a>
								</li>
                                                            </c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="user-info-dropdown pt-3">
				<div class="dropdown">
					<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
						<span class="user-name">${pageContext.request.userPrincipal.name}</span>
					</a>
					<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                                <a class="dropdown-item" href="<c:url value="/"/>"><i class="dw dw-user1"></i> Website</a>
                                                <a class="dropdown-item" href="<c:url value="/logout"/>"><i class="dw dw-logout"></i> Log Out</a>
                                        </div>
				</div>
			</div>
                </div>
	</div>

	<div class="right-sidebar">
		<div class="sidebar-title">
			<h3 class="weight-600 font-16 text-blue">
				Layout Settings
				<span class="btn-block font-weight-400 font-12">User Interface Settings</span>
			</h3>
			<div class="close-sidebar" data-toggle="right-sidebar-close">
				<i class="icon-copy ion-close-round"></i>
			</div>
		</div>
		<div class="right-sidebar-body customscroll">
			<div class="right-sidebar-body-content">
				<h4 class="weight-600 font-18 pb-10">Header Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);" class="btn btn-outline-primary header-white active">White</a>
					<a href="javascript:void(0);" class="btn btn-outline-primary header-dark">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);" class="btn btn-outline-primary sidebar-light ">White</a>
					<a href="javascript:void(0);" class="btn btn-outline-primary sidebar-dark active">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Menu Dropdown Icon</h4>
				<div class="sidebar-radio-group pb-10 mb-10">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebaricon-1" name="menu-dropdown-icon" class="custom-control-input" value="icon-style-1" checked="">
						<label class="custom-control-label" for="sidebaricon-1"><i class="fa fa-angle-down"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebaricon-2" name="menu-dropdown-icon" class="custom-control-input" value="icon-style-2">
						<label class="custom-control-label" for="sidebaricon-2"><i class="ion-plus-round"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebaricon-3" name="menu-dropdown-icon" class="custom-control-input" value="icon-style-3">
						<label class="custom-control-label" for="sidebaricon-3"><i class="fa fa-angle-double-right"></i></label>
					</div>
				</div>

				<h4 class="weight-600 font-18 pb-10">Menu List Icon</h4>
				<div class="sidebar-radio-group pb-30 mb-10">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-1" name="menu-list-icon" class="custom-control-input" value="icon-list-style-1" checked="">
						<label class="custom-control-label" for="sidebariconlist-1"><i class="ion-minus-round"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-2" name="menu-list-icon" class="custom-control-input" value="icon-list-style-2">
						<label class="custom-control-label" for="sidebariconlist-2"><i class="fa fa-circle-o" aria-hidden="true"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-3" name="menu-list-icon" class="custom-control-input" value="icon-list-style-3">
						<label class="custom-control-label" for="sidebariconlist-3"><i class="dw dw-check"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-4" name="menu-list-icon" class="custom-control-input" value="icon-list-style-4" checked="">
						<label class="custom-control-label" for="sidebariconlist-4"><i class="icon-copy dw dw-next-2"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-5" name="menu-list-icon" class="custom-control-input" value="icon-list-style-5">
						<label class="custom-control-label" for="sidebariconlist-5"><i class="dw dw-fast-forward-1"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-6" name="menu-list-icon" class="custom-control-input" value="icon-list-style-6">
						<label class="custom-control-label" for="sidebariconlist-6"><i class="dw dw-next"></i></label>
					</div>
				</div>

				<div class="reset-options pt-30 text-center">
					<button class="btn btn-danger" id="reset-settings">Reset Settings</button>
				</div>
			</div>
		</div>
	</div>

	<div class="left-side-bar">
		<div class="brand-logo">
                    <a href="<c:url value="/admin" />">
                        <img src="<c:url value="/admin/vendors/images/deskapp-logo.png" />" alt="" class="dark-logo">
                        <img src="<c:url value="/admin/vendors/images/deskapp-logo-white.png" />" alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li class="dropdown">
                                                <a href="<c:url value="/admin"/>" class="dropdown-toggle">
							<span class="micon dw dw-house-1"></span><span class="mtext">Home</span>
						</a>
					</li>
                                        <li class="dropdown">
                                                <a href="javascript:;" class="dropdown-toggle">
							<span class="micon dw dw-paper-plane"></span><span class="mtext">Tour</span>
						</a>
                                                <ul class="submenu">
                                                        <li><a href="<c:url value="/admin/tour"/>">All Tour</a></li>
                                                        <li><a href="<c:url value="/admin/add_tour"/>">Add Tour</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon bi bi-building"></span><span class="mtext">City</span>
						</a>
						<ul class="submenu">
                                                        <li><a href="<c:url value="/admin/city"/>">All City</a></li>
                                                        <li><a href="<c:url value="/admin/add_city"/>">Add City</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon bi bi-bookmark-check"></span><span class="mtext">Tag</span>
						</a>
						<ul class="submenu">
                                                        <li><a href="<c:url value="/admin/tag"/>">All Tag</a></li>
                                                        <li><a href="<c:url value="/admin/add_tag"/>">Add Tag</a></li>
						</ul>
					</li>
                                        <li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon fas fa-chair"></span><span class="mtext">Seat</span>
						</a>
						<ul class="submenu">
                                                        <li><a href="<c:url value="/admin/seat"/>">All Seat</a></li>
                                                        <li><a href="<c:url value="/admin/add_seat"/>">Add Seat</a></li>
						</ul>
					</li>
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                        <li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon fa fa-user-o"></span><span class="mtext">Staff</span>
						</a>
						<ul class="submenu">
                                                        <li><a href="<c:url value="/staff"/>">All Staff</a></li>
                                                        <li><a href="<c:url value="/staff/add_staff"/>">Add Staff</a></li>
						</ul>
					</li>
                                        </sec:authorize>
                                        <li class="dropdown">
                                                <a href="<c:url value="/admin/customer"/>" class="dropdown-toggle">
							<span class="micon fa fa-users"></span><span class="mtext">Customers</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
            
	<div class="main-container">
		<tiles:insertAttribute name="content" />
	</div>
	<!-- js -->
        <script src="<c:url value="/admin/vendors/scripts/core.js" />"></script>
        <script src="<c:url value="/admin/vendors/scripts/script.min.js" />"></script>
        <script src="<c:url value="/admin/vendors/scripts/process.js" />"></script>
        <script src="<c:url value="/admin/vendors/scripts/layout-settings.js" />"></script>
        <script src="<c:url value="/admin/src/plugins/apexcharts/apexcharts.min.js" />"></script>
        <script src="<c:url value="/admin/src/plugins/datatables/js/jquery.dataTables.min.js" />"></script>
        <script src="<c:url value="/admin/src/plugins/datatables/js/dataTables.bootstrap4.min.js" />"></script>
        <script src="<c:url value="/admin/src/plugins/datatables/js/dataTables.responsive.min.js" />"></script>
        <script src="<c:url value="/admin/src/plugins/datatables/js/responsive.bootstrap4.min.js" />"></script>
        <script src="<c:url value="/admin/vendors/scripts/dashboard.js" />"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/4dbfaa32c4.js" crossorigin="anonymous"></script>
</body>
</html>