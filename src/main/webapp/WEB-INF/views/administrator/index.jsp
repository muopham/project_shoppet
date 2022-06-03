<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>ShopPet</title>
<!-- Favicon icon -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
</head>

<body>
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">

		<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
		<!-- wrapper -->


		<div class="page-wrapper">
			<div class="container-fluid">
				<!-- *************************************************************** -->
				<!-- Start First Cards -->
				<!-- *************************************************************** -->
				<div class="card-group">
					<div class="card border-right">
						<div class="card-body">
							<div class="d-flex d-lg-flex d-md-block align-items-center">
								<div>
									<div class="d-inline-flex align-items-center">
										<h2 class="text-dark mb-1 font-weight-medium">${userList }</h2>
										<span
											class="badge font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none"></span>
									</div>
									<h6
										class="text-muted font-weight-normal mb-0 w-100 text-truncate">
										Tài khoản</h6>
								</div>
								<div class="ml-auto mt-md-3 mt-lg-0">
									<span class="opacity-7 text-muted"><i
										data-feather="user-plus"></i></span>
								</div>
							</div>
						</div>
					</div>
					<div class="card border-right">
						<div class="card-body">
							<div class="d-flex d-lg-flex d-md-block align-items-center">
								<div>
									<h2
										class="text-dark mb-1 w-100 text-truncate font-weight-medium">
										<sup class="set-doller"></sup>${total }
									</h2>
									<h6
										class="text-muted font-weight-normal mb-0 w-100 text-truncate">Doanh thu</h6>
								</div>
								<div class="ml-auto mt-md-3 mt-lg-0">
									<span class="opacity-7 text-muted"><i data-feather="dollar-sign"></i></span>
								</div>
							</div>
						</div>
					</div>
					<div class="card border-right">
						<div class="card-body">
							<div class="d-flex d-lg-flex d-md-block align-items-center">
								<div>
									<div class="d-inline-flex align-items-center">
										<h2 class="text-dark mb-1 font-weight-medium">${saleOrderList }</h2>
										<span
											class="badge font-12 text-white font-weight-medium badge-pill ml-2 d-md-none d-lg-block"></span>
									</div>
									<h6
										class="text-muted font-weight-normal mb-0 w-100 text-truncate">Số đơn hàng</h6>
								</div>
								<div class="ml-auto mt-md-3 mt-lg-0">
									<span class="opacity-7 text-muted"><i
										data-feather="file-plus"></i></span>
								</div>
							</div>
						</div>
					</div>
					
				</div>									
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>

</body>

</html>