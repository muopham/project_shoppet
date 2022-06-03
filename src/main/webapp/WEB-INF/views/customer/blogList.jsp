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
					<div class="row">
						<div class="col-lg-3 none block">
							<div class="section__sidebar-widget">
								<div class="widget__inner">
									<div class="widget__list">
										<h3 class="widget__title">Search</h3>
										<div class="widget__search-box">
											<input type="text" placeholder="Tìm kiếm..."
												class="widget__input">
											<button class="search-icon">
												<i class='bx bx-search'></i>
											</button>
										</div>
									</div>
									<div class="widget__list">
										<h3 class="widget__title">Danh mục</h3>
										<div class="widget__list-body">
											<ul class="sidebar-list">
												<li><a href="#">Tất cả sảm phẩm</a></li>
												<li><a href="#">Chó Alaska Malamute (29)</a></li>
												<li><a href="#">Chó Corgi (18)</a></li>
												<li><a href="#">Chó Poodle (20)</a></li>
												<li><a href="#">Mèo Anh (Dài + Ngắn) (3)</a></li>
												<li><a href="#">Sản phẩm mới (8)</a></li>
											</ul>
										</div>
									</div>
									<div class="widget__list">
										<h3 class="widget__title">Tags</h3>
										<div class="widget__list-body">
											<ul class="tags">
												<li><a href="#">Dogs</a></li>
												<li><a href="#">Cats</a></li>
												<li><a href="#">Alaska</a></li>
												<li><a href="#">Thức ăn</a></li>
												<li><a href="#">Hubby</a></li>
												<li><a href="#">Animals</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9 col-12">
							<div class="toolbar__wrapper">
								<div class="toolbar__left">
									<div class="tool__left-btn">
										<i class='bx bxs-grid active-btn'></i> <i class='bx bx-menu'></i>
									</div>
								</div>
							</div>
							<div class="row section__shop-wrapper">

								<c:forEach items="${blogs}" var="blog">
									<div class="col-12 col-lg-6 col-md-6">
										<div class="product">
											<div class="thumb">
												<a href="${base }/tin-tuc/${blog.seo}" class="image"> <img
													src="${base }/upload/${blog.avatar}" class="fit-img opacity-img">
												</a>
											</div>
											<div class="content">
												<div class="new__author">
													<p class="author">
														By <strong>Admin</strong> - ${blog.createdDate}
													</p>
												</div>
												<a href="${base }/tin-tuc/${blog.seo}" class="content-link">
													<h5 class="title">${blog.title}</h5>
												</a>
												<div class="new__desc">
													<p class="desc">${blog.shortDes}</p>
												</div>
												<div class="new__more">
													<a href="${base }/tin-tuc/${blog.seo}"><span>More</span></a>
												</div>
											</div>
										</div>
									</div>

								</c:forEach>
							</div>
							<div class="section__shop-toolbars">
								<div class="shop__toolbar">
									<ul class="pagination">
										<li class="pages-item active"><a href="#"
											class="pages-link">1</a></li>
										<li class="pages-item"><a href="#" class="pages-link">2</a></li>
										<li class="pages-item"><a href="#" class="pages-link">3</a></li>
										<li class="pages-item"><a href="#" class="pages-link"><i
												class='bx bx-chevrons-right'></i></a></li>
									</ul>
								</div>
							</div>
						</div>
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