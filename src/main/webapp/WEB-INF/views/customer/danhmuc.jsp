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
							href="${base}/danh-muc">Danh mục sản phẩm</a></span>
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
										<form class="form-inline" action="${base }/danh-muc"
											method="get">
											<div class="widget__search-box">
												<input type="hidden" id="page" name="page"
													class="form-control"> <input type="text"
													id="keyword" name="keyword" class="widget__input"
													placeholder="Tìm kiếm..." value="${searchModel.keyword }">

												<button type="submit" id="btnSearch" name="btnSearch "
													value="Search" class="search-icon">
													<i class='bx bx-search'></i>
												</button>
											</div>

										</form>
									</div>
									<div class="widget__list">
										<h3 class="widget__title">Danh mục</h3>
										<div class="widget__list-body">
											<ul class="sidebar-list">
												<li><a href="${base }/danh-muc">Tất cả sảm phẩm</a></li>
												<li><a href="#">Chó Alaska Malamute </a></li>
												<li><a href="#">Chó Corgi </a></li>
												<li><a href="#">Chó Poodle </a></li>
												<li><a href="#">Mèo Anh (Dài + Ngắn) </a></li>
												<li>
													<form action="${base}/danh-muc" method="get">
														<input type="hidden" name="isHot" value="1">														
														<button type="submit"
															style="border: none; background: transparent; padding: 0;">Sản phẩm mới</button>
													</form>
												</li>
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
													<form action="">
														<input type="hidden" name="sortField" value="price_sale">
														<input type="hidden" name="sortDir" value="asc">
														<button type="submit"
															style="border: none; background: transparent;">Theo
															giá: Thấp - cao</button>
													</form>
												</li>
												<li>
													<form action="">
														<input type="hidden" name="sortField" value="price_sale">
														<input type="hidden" name="sortDir" value="desc">
														<button type="submit"
															style="border: none; background: transparent;">Theo
															giá: Cao - thấp</button>
													</form>
												</li>
												<li>
													<form action="">
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
							<div class="toolbar__wrapper">
								<div class="toolbar__left">
									<div class="tool__left-btn">
										<i class='bx bxs-grid active-btn'></i> <i class='bx bx-menu'></i>
									</div>
								</div>

							</div>

							<div class="row section__shop-wrapper">


								<c:forEach items="${products.data }" var="product">

									<c:if test="${product.status == true}">

										<div class="col-12 col-lg-4 col-md-6">
											<div class="product">
												<div class="thumb">
													<a href="${base}/danh-muc/san-pham/${product.seo}"
														class="image"> <img
														src="${base }/upload/${product.avatar}"
														class="fit-img zoom-img">
													</a> <span class="badges"> <c:if
															test="${product.isHot == true }">
															<span class="new">new</span>
														</c:if> <span class="sale">-${(1 - product.priceSale /
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
							<div class="section__shop-toolbars">
								<!-- Paging -->
								<div class="row">
									<div class="col-12 d-flex justify-content-center">
										<div id="paging"></div>
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

	<script type="text/javascript">

				$(document).ready(function () {
					$("#categoryId").val(${ searchModel.categoryId });

					$("#paging").pagination({
						currentPage: ${ products.currentPage },
						items: ${ products.totalItems },
						itemsOnPage: 12,
						cssStyle: 'light-theme',
						onPageClick: function (pageNumber, event) {
							$('#page').val(pageNumber);
							$('#btnSearch').trigger('click');
						},
			    });

				});
				
			
		        var slider = document.getElementById("customRange1");
		        var output = document.getElementById("demo");
		        output.innerHTML = slider.value;

		        slider.oninput = function () {
		            output.innerHTML = this.value;
		        }
		   
			</script>

</body>

</html>