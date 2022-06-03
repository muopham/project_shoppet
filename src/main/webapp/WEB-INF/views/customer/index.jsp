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
<title>PetShop</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

</head>

<body>
	<div class="wrapper">

		<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

		<main class="main">
			<div class="main__products-hot">
				<div class="container">
					<div class="main__products-title">
						<p>Sản phẩm nổi bật</p>
					</div>
					<div class="main__products-content">
						<div class="row">

							<div class="swiper myRelated2">
								<div class="swiper-wrapper">
									<c:forEach items="${products }" var="product">
										<c:if
											test="${product.isHot == true && product.status == true}">
											<div class="swiper-slide">
												<div class="product">
													<div class="thumb">
														<a href="${base}/danh-muc/san-pham/${product.seo}"
															class="image"> <img
															src="${base }/upload/${product.avatar}"
															class="fit-img zoom-img">
														</a> <span class="badges"> <c:if
																test="${product.isHot == true }">
																<span class="new">new</span>
															</c:if> <span class="sale">-${(1 - product.priceSale / product.price)*100}%
														</span>
														</span>

													</div>
													<div class="content">
														<a href="${base}/danh-muc/san-pham/${product.seo}"
															class="content-link">
															<h5 class="title">${product.title }</h5>
														</a> <span class="price"> <span class="old"> <fmt:setLocale
																	value="vi_VN" /> <fmt:formatNumber
																	value="${product.price}" /> đ
														</span> <span class="new"> <fmt:setLocale value="vi_VN" />
																<fmt:formatNumber value="${product.priceSale}" /> đ
														</span>
														</span> <span class="symbol"> <a href="#"><i
																class='bx bx-heart'></i></a> <a
															onclick="AddToCart('${base }', ${product.id}, 1);"><i
																class='bx bx-cart'></i></a>
														</span>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>

								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
					<!-- <div class="main__products-more">
                        <a href="#">Xem thêm</a>
                    </div> -->
				</div>
			</div>
			<!-- Sale -->
			<div class="main__products-sale">
				<div class="container">
					<div class="row">
						<div class="col-12 col-lg-6">
							<a href="${base }/danh-muc" class="banner-sale"> <img
								src="${base}/img/oder-1.jpg" alt="">
							</a>
						</div>
						<div class="col-12 col-lg-6 block none">
							<a href="${base }/danh-muc" class="banner-sale"> <img
								src="${base}/img/oder-2.jpg" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Danh mục sản phẩm -->
			<div class="main__products">
				<div class="container">
					<div class="main__products-title">
						<p>Danh sách sản phẩm</p>
					</div>
					<div class="main__products-content">
						<div class="row">
							<c:forEach items="${products }" var="product" begin="1" end="8">
								<c:if test="${product.status == true}">
									<div class="col-12 col-lg-3 col-md-6">
										<div class="product">
											<div class="thumb">
												<a href="${base}/danh-muc/san-pham/${product.seo}"
													class="image"> <img
													src="${base }/upload/${product.avatar}"
													class="fit-img zoom-img">
												</a> <span class="badges"> <c:if
														test="${product.isHot == true }">
														<span class="new">new</span>
													</c:if> <span class="sale">-${(1 - product.priceSale / product.price)  * 100}%
												</span>
												</span>

											</div>
											<div class="content">
												<a href="${base}/danh-muc/san-pham/${product.seo}"
													class="content-link">
													<h5 class="title">${product.title }</h5>
												</a> <span class="price"> <span class="old"> <fmt:setLocale
															value="vi_VN" /> <fmt:formatNumber
															value="${product.price}" /> đ
												</span> <span class="new"> <fmt:setLocale value="vi_VN" />
														<fmt:formatNumber value="${product.priceSale}" />
														đ
												</span>
												</span> <span class="symbol"> <a href="#"><i
														class='bx bx-heart'></i></a> <a
													onclick="AddToCart('${base }', ${product.id}, 1);"><i
														class='bx bx-cart'></i></a>
												</span>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="main__products-more">
						<a href="${base }/danh-muc">Xem thêm</a>
					</div>
				</div>
			</div>
			<!-- Danh sách phụ kiện -->
			
			<!-- Tin tức -->
			<div class="main__news">
				<div class="container">
					<div class="row">
						<div class="main__products-title">
							<p>Blog</p>
						</div>
						<c:forEach items="${blogs}" var="blog" begin="1" end="3">
							<div class="col-12 col-lg-4 col-md-6">
								<div class="product">
									<div class="thumb">
										<a href="${base }/tin-tuc/${blog.seo}" class="image"> <img
											src="${base }/upload/${blog.avatar}"
											class="fit-img opacity-img">
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
				</div>
			</div>
			<!-- main bottom -->
			<div class="main__bottom">
				<div class="container">
					<div class="row">
						<div class="col-lg-4 none block">
							<div class="main__bottom-wrap">
								<div class="wrap__icon">
									<i class='bx bxs-truck'></i>
								</div>
								<div class="wrap__content">
									<h4 class="title">FREE SHIPPING</h4>
									<p>Free shipping on all order</p>
								</div>
							</div>
						</div>
						<div class="col-lg-4 none block">
							<div class="main__bottom-wrap">
								<div class="wrap__icon">
									<i class='bx bx-headphone'></i>
								</div>
								<div class="wrap__content">
									<h4 class="title">ONLINE SUPPORT</h4>
									<p>Online live support 24/7</p>
								</div>
							</div>
						</div>
						<div class="col-lg-4 none block">
							<div class="main__bottom-wrap">
								<div class="wrap__icon">
									<i class='bx bx-bar-chart-alt'></i>
								</div>
								<div class="wrap__content">
									<h4 class="title">MONEY RETURN</h4>
									<p>Back guarantee under 5 days</p>
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

</body>

</html>