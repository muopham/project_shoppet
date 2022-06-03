<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Danh sách sản phẩm</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
<link rel="stylesheet" href="${base}/css/danhmuc.css">

</head>

<body>
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

		<main class="main">
			<div class="main__breadcrumb">
				<div class="container">
					<div class="bread-crumb">
						<span><a href="${base}/">Trang chủ</a></span> <span><a
							href="${base}/tin-tuc">Tin tức</a></span>

					</div>
				</div>
			</div>
			<div class="main__section">
				<div class="container">
					<div class="col-lg-8 m-auto">
						<div class="img-fix" style="width: 100%; overflow: hidden;">
							<img style="width: 100%;" src="${base }/upload/${blog.avatar}"
								alt="">
						</div>
						
						<p style="font-size: 24px; font-weight:bold ;margin:20px 0 ;">${blog.title}</p>
						<p>${blog.details}</p>
					</div>

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

	<script type="text/javascript">
		
	</script>

</body>

</html>