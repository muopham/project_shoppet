<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<!DOCTYPE html>
				<html lang="en">

				<head>
					<meta charset="UTF-8">
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<title>Giỏ hàng</title>
					<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
					<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
					<link rel="stylesheet" href="${base}/css/danhmuc.css">
					<link rel="stylesheet" href="${base}/css/lienhe.css">
				</head>

				<body>

					<div class="wrapper">
						<!-- header -->

						<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

						<main class="main">
							<div class="main__breadcrumb">
								<div class="container">
									<div class="bread-crumb" >
										<span><a href="${base }/">Trang chủ</a></span> <span><a
												href="${base }/cart/view">Giỏ hàng</a></span>
									</div>
								</div>
							</div>
							<div class="main__contact">
								<div style="text-align: center; font-size: 20px; font-weight: bold; padding: 20px 0; ">
									<a href="${base }/login" style="color: #0000008c;">Đăng nhập để thanh toán!</a>
								</div>
								
							</div>
						</main>
						<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
						<div class="scroll__top">
							<i class='bx bx-up-arrow-alt'></i>
						</div>

						<jsp:include page="/WEB-INF/views/customer/layout/headerMobile.jsp"></jsp:include>

					</div>

					<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

					<script>



					</script>
				</body>

				</html>