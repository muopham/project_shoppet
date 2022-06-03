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
<link rel="stylesheet" href="${base}/css/sanpham.css">

</head>

<body>

	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v13.0"
		nonce="Hnc1mahQ"></script>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

	<main class="main">
		<div class="main__breadcrumb">
			<div class="container">
				<div class="bread-crumb">
					<span><a href="${base}/">Trang chủ</a></span> <span><a
						href="${base}/danh-muc">Danh mục sản phẩm</a></span> <span><a
						href="${base}/danh-muc/san-pham">Sản phẩm</a></span><span><a
						>${product.title }</a></span>
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
											<li><a href="${base }/danh-muc">Tất cả sảm phẩm</a></li>
											<li><a href="#">Chó Alaska Malamute</a></li>
											<li><a href="#">Chó Corgi </a></li>
											<li><a href="#">Chó Poodle </a></li>
											<li><a href="#">Mèo Anh (Dài + Ngắn) </a></li>
											<li><a href="#">Sản phẩm mới </a></li>
										</ul>
									</div>
								</div>		
								
								<div class="widget__list">
										<h3 class="widget__title">Sắp xếp</h3>
										<div class="widget__list-body">
											<ul class="sidebar-list">
												<li>
													<form action="${base}/danh-muc" method="get">
														<input type="hidden" name="sortField" value="title">
														<input type="hidden" name="sortDir" value="asc">
														<button type="submit"
															style="border: none; background: transparent;">Theo
															tên</button>
													</form>
												</li>
												<li>
													<form action="${base}/danh-muc" method="get">
														<input type="hidden" name="sortField" value="price_sale">
														<input type="hidden" name="sortDir" value="asc">
														<button type="submit"
															style="border: none; background: transparent;">Theo
															giá: Thấp - cao</button>
													</form>
												</li>
												<li>
													<form action="${base}/danh-muc" method="get">
														<input type="hidden" name="sortField" value="price_sale">
														<input type="hidden" name="sortDir" value="desc">
														<button type="submit"
															style="border: none; background: transparent;">Theo
															giá: Cao - thấp</button>
													</form>
												</li>
												<li>
													<form action="${base}/danh-muc" method="get">
														<label style="margin-bottom: 20px; margin-left: 7px;"
															for="customRange1" class="form-label">Theo giá: <span
															id="demo"></span>đ
														</label>
														<div style="display: flex;">
															<span>0</span> <input type="range" min="0" max="10000000"
																step="1000000" name="sortPrice" value="0"
																style="margin: 0 10px;" class="form-range"
																id="customRange1"> <span>10tr</span>
														</div>
														<button type="submit"
															style="border: none; background: #f6ab49; color: aliceblue; padding: 5px 10px; border-radius: 8px; margin-top: 25px; margin-left: 70px;">Tìm
															kiếm</button>
													</form>
												</li>

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
						<div class="section__product-detail">
							<div class="row">
								<div class="col-12 col-lg-5">
									<div class="product__detail-img">
										<div class="swiper myProduct">
											<div class="swiper-wrapper">
												<c:forEach items="${productImg }" var="productImg">
													<div class="swiper-slide">
														<img src="${base}/upload/${productImg.path }" alt=""
															class="swiper__product-img">
													</div>

												</c:forEach>
											</div>
											
											<div class="swiper-pagination"></div>
										</div>
									</div>
								</div>
								<div class="col-12 col-lg-7">
									<div class="product__detail-summery">
										<div class="product__header mb-10">
											<h2 class="product__header-title">${product.title }</h2>
										</div>
										<div class="product__price mb-10">
											<span class="curr__price"> <fmt:setLocale
													value="vi_VN" /> <fmt:formatNumber
													value="${product.priceSale}" /> đ
											</span> <span class="old__price"> <fmt:setLocale
													value="vi_VN" /> <fmt:formatNumber
													value="${product.price}" /> đ
											</span>
										</div>
										<div class="product__code mb-10">
											<span>Mã đơn hàng: ${product.id }</span>
										</div>
										<div class="product__inventroy mb-10">
											<span class="inventroy-title">Tình trạng: </span> <span
												class="inventory__varient">Còn hàng</span>
										</div>
										<div class="product__quantity mb-10">
											<span> Số lượng: </span>
											<div class="quantity__plus mb-10">
												<input type="number" id="quanlity" value="1">
											</div>
										</div>
										<div class="product__cart-button">
											<div class="add__to__cart">
												<a
													onclick="AddToCart('${base }', ${product.id}, getValue());"
													class="add-cart-link">Add to cart</a>
											</div>
											<a href="#" class="add-cart-heart"> <i
												class='bx bx-heart'></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- chi tiết sản phẩm -->
						<div class="section__product-description">
							<h2 class="detail__heading">Chi tiết sản phẩm</h2>
							<div class="detail__text">
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Aspernatur nulla voluptatum dolor, quidem quaerat saepe in.
									Obcaecati voluptatem ea sapiente, neque soluta incidunt harum a
									facilis possimus fuga distinctio voluptates. Lorem ipsum dolor
									sit amet consectetur, adipisicing elit. Maiores esse sequi at
									eius cumque. Temporibus architecto sunt aperiam corporis
									corrupti repellendus doloremque itaque recusandae facere
									provident voluptate dolore, nulla mollitia? Lorem ipsum dolor
									sit, amet consectetur adipisicing elit. Deserunt, fugit
									adipisci. Quasi laboriosam sapiente, explicabo repellat, nemo
									ex tempore deserunt a accusamus quas deleniti debitis
									obcaecati, fugiat reiciendis mollitia architecto? Lorem ipsum
									dolor sit amet consectetur adipisicing elit. Quia eos magni
									eius eligendi distinctio? Debitis porro veritatis perferendis
									officia iusto nostrum quisquam ducimus, consequuntur
									accusantium doloribus quibusdam voluptatum recusandae magnam?</p>
							</div>
						</div>

						<div class="fb-comments" data-href="http://localhost:8080/"
							data-width="800" data-numposts="5"></div>


						<!-- sản phẩm tương tự -->
						<div class="related__products">
							<div class="main__products-title">
								<p>Sản phẩm tương tự</p>
							</div>
							<div class="row">
								<div class="swiper myRelated">
									<div class="swiper-wrapper">
										<c:forEach items="${products }" var="product">
											<c:if test="${product.status == true}">
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
																</c:if> <span class="sale">-${(1 -
																						product.priceSale /
																						product.price)*100}%
															</span>
															</span>

														</div>
														<div class="content">
															<a href="${base}/danh-muc/san-pham/${product.seo}"
																class="content-link">
																<h5 class="title">${product.title }</h5>

															</a> <span class="price"> <span class="old"> <fmt:setLocale
																		value="vi_VN" /> <fmt:formatNumber
																		value="${product.price}" type="currency" />
															</span> <span class="new"> <fmt:setLocale value="vi_VN" />
																	<fmt:formatNumber value="${product.priceSale}"
																		type="currency" />
															</span>
															</span> <span class="symbol"> <a href="#"><i
																	class='bx bx-heart'></i></a> <a
																onclick="AddToCart('${base }', ${product.id}, getValue());"><i
																	class='bx bx-cart'></i></a>
															</span>
														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
									<div class="swiper-button-next next"></div>
									<div class="swiper-button-prev prev"></div>
									<div class="swiper-pagination"></div>
								</div>
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

	<script>
						function getValue() {
							return document.getElementById("quanlity").value;
						}
					</script>

</body>

</html>