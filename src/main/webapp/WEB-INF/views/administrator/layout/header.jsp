<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="topbar" data-navbarbg="skin6">
	<nav class="navbar top-navbar navbar-expand-md">
		<div class="navbar-header" data-logobg="skin6">
			<a class="nav-toggler waves-effect waves-light d-block d-md-none"
				href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
			<div class="navbar-brand">
				<!-- Logo icon -->
				<a href="${base }/admin"> <b class="logo-icon"> <!-- Dark Logo icon -->
						<img src="${base}/admin/assets/images/logo-icon.png"
						alt="homepage" class="dark-logo" /> <!-- Light Logo icon --> <img
						src="${base}/admin/assets/images/logo-icon.png" alt="homepage"
						class="light-logo" />
				</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
						<!-- dark Logo text --> <img
						src="${base}/admin/assets/images/logo-text.png" alt="homepage"
						class="dark-logo" /> <!-- Light Logo text --> <img
						src="${base}/admin/assets/images/logo-light-text.png"
						class="light-logo" alt="homepage" />
				</span>
				</a>
			</div>
			<a class="topbartoggler d-block d-md-none waves-effect waves-light"
				href="javascript:void(0)" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation"><i class="ti-more"></i></a>
		</div>

		<div class="navbar-collapse collapse" id="navbarSupportedContent">

			<ul class="navbar-nav float-left mr-auto ml-3 pl-1">
			</ul>

			<ul class="navbar-nav float-right">

				<li class="nav-item d-none d-md-block"><a class="nav-link"
					href="javascript:void(0)"> </a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="javascript:void(0)"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="${base}/admin/assets/images/users/profile-pic.jpg"
						alt="user" class="rounded-circle" width="40"> <span
						class="ml-2 d-none d-lg-inline-block"><span
							class="text-dark">Admin</span> <i data-feather="chevron-down"
							class="svg-icon"></i></span>
				</a>
					<div
						class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
						<a class="dropdown-item" href="javascript:void(0)"><i
							data-feather="user" class="svg-icon mr-2 ml-1"></i> My Profile</a> <a
							class="dropdown-item" href="javascript:void(0)"><i
							data-feather="credit-card" class="svg-icon mr-2 ml-1"></i> My
							Balance</a> <a class="dropdown-item" href="javascript:void(0)"><i
							data-feather="mail" class="svg-icon mr-2 ml-1"></i> Inbox</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="javascript:void(0)"><i
							data-feather="settings" class="svg-icon mr-2 ml-1"></i> Account
							Setting</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${base }/logout"><i
							data-feather="power" class="svg-icon mr-2 ml-1"></i> Logout</a>
						<div class="dropdown-divider"></div>
						<div class="pl-4 p-3">
							<a href="javascript:void(0)" class="btn btn-sm btn-info">View
								Profile</a>
						</div>
					</div></li>
			</ul>
		</div>
	</nav>
</header>
<aside class="left-sidebar" data-sidebarbg="skin6">
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar" data-sidebarbg="skin6">
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav">
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="${base }/admin" aria-expanded="false"><i
						data-feather="home" class="feather-icon"></i><span
						class="hide-menu">Dashboard</span></a></li>
				<li class="list-divider"></li>
				<li class="sidebar-item"><a class="sidebar-link has-arrow"
					href="javascript:void(0)"> <i class="icon-grid"></i><span
						class="hide-menu">Danh mục </span></a>
					<ul aria-expanded="false"
						class="collapse  first-level base-level-line">
						<li class="sidebar-item"><a
							href="${base }/admin/danh-sach-danh-muc" class="sidebar-link"><span
								class="hide-menu"> Danh sách danh mục </span></a></li>
						<li class="sidebar-item"><a
							href="${base }/admin/them-danh-muc" class="sidebar-link"><span
								class="hide-menu"> Thêm danh mục </span></a></li>
					</ul></li>
				<li class="sidebar-item"><a class="sidebar-link has-arrow"
					href="javascript:void(0)" aria-expanded="false"> <i
						class="icon-tag"></i><span class="hide-menu ">Sản phẩm </span></a>
					<ul aria-expanded="false"
						class="collapse  first-level base-level-line">
						<li class="sidebar-item"><a
							href="${base }/admin/danh-sach-san-pham" class="sidebar-link"><span
								class="hide-menu"> Danh sách sản phẩm </span></a></li>
						<li class="sidebar-item"><a
							href="${base }/admin/them-san-pham" class="sidebar-link"><span
								class="hide-menu"> Thêm sản phẩm </span></a></li>
					</ul></li>

				<li class="sidebar-item"><a class="sidebar-link has-arrow"
					href="javascript:void(0)" aria-expanded="false"><i
						class="icon-calender"></i><span class="hide-menu">Blog </span></a>
					<ul aria-expanded="false"
						class="collapse  first-level base-level-line">
						<li class="sidebar-item"><a
							href="${base }/admin/danh-sach-tin-tuc" class="sidebar-link"><span
								class="hide-menu"> Danh sách tin tức </span></a></li>
						<li class="sidebar-item"><a
							href="${base }/admin/them-tin-tuc" class="sidebar-link"><span
								class="hide-menu"> Thêm tin tức </span></a></li>
					</ul></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="${base }/admin/danh-sach-lien-he" aria-expanded="false"><i
						class="far fa-address-book"></i><span class="hide-menu">Liên
							hệ </span></a></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="${base }/admin/danh-sach-user" aria-expanded="false"><i
						class="icon-user"></i><span class="hide-menu">Tài khoản</span></a></li>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="${base }/admin/view-order" aria-expanded="false"><i
						class="icon-basket-loaded"></i><span class="hide-menu">Đơn
							hàng </span></a>
				<li class="sidebar-item"><a class="sidebar-link sidebar-link"
					href="${base }/logout" aria-expanded="false"><i
						class=" fas fa-sign-out-alt"></i><span class="hide-menu">Log
							out </span></a></li>
			</ul>
		</nav>

	</div>

</aside>