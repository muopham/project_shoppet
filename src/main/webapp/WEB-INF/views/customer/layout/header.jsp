<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header">
	<div class="header__top">
		<div class="container">
			<p class="header__top-title">Welcome To our shop !</p>
			<p class="header__top-title"> 
				<c:if test="${isLogined}">
					<a href="${base }/profile/${userLogined.id}">${userLogined.username }</a> 
					<a href="${base }/logout"><i class='bx bx-log-out'></i></a>
			</c:if>
			</p>
		</div>
	</div>
	<div class="header__bottom">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-6">
					<div class="header__bottom-logo">
						<a href="${base}/"><img src="${base}/img/logo.jpg"
							alt="áº¢nh logo" class="logo"></a>
					</div>
				</div>
				<div class="col-lg-6 block none">
					<div class="header__bottom-menu">
						<ul>
							<li class="header__bottom-menu-children"><a href="${base}/">Trang
									chủ</a></li>
							<li class="header__bottom-menu-children"><a href="#">Thú
									cưng</a>
								<ul class="subnav">

									<c:forEach items="${categories }" var="category">
										<c:if test="${category.status == true}">
											<li class="mega__subnav-menu"><a
												href="${base }/danh-muc/${category.seo}">${category.name }</a></li>
										</c:if>
									</c:forEach>
								</ul></li>
							<li class="header__bottom-menu-children"><a href="${base }/tin-tuc">Blog</a></li>
							<li class="header__bottom-menu-children"><a href="#">Dịch
									vụ</a>
								<ul class="subnav">
									<li><a href="#">Spa</a></li>
									<li><a href="#">Chăm sóc thú cưng</a></li>
								</ul></li>
							<li class="header__bottom-menu-children"><a
								href="${base }/contact">Liên hệ</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-8 col-6">
					<div class="header__bottom-actions">
						<div class=" header__bottom-btn header__bottom-search">
							<a><i class='bx bx-search'></i></a>
							<div class="header__box">
								<div class="header__bottom-box-search">
									<form class="form-inline" action="${base }/danh-muc"
										method="get" style="display: flex">
										<input type="hidden" id="page" name="page"
											class="form-control"> <input type="text" id="keyword"
											name="keyword" class="header__search-input"
											placeholder="Tìm kiếm..." placeholder="Search"
											value="${searchModel.keyword }">
										<button type="submit" id="btnSearch" name="btnSearch "
											value="Search" class="header__search-btn">
											<i class='bx bx-search'></i>
										</button>
									</form>

								</div>
							</div>
						</div>
						<div class=" header__bottom-btn header__bottom-user">
							<a href="${base}/admin"><i class='bx bx-user'></i></a>
						</div>
						<div class=" header__bottom-btn header__bottom-cart">
							<a href="${base }/cart/view"><i class='bx bx-cart'></i></a>

							<c:choose>
								<c:when test="${cart.cartItems == null || totalItems == 0}">
									<span class="header__bottom-num" id="iconShowTotalItemsInCart">0</span>
								</c:when>

								<c:otherwise>
									<span class="header__bottom-num" id="iconShowTotalItemsInCart">${totalItems }</span>
								</c:otherwise>
							</c:choose>							
						</div>
						<div class="header__bottom-btn header__bottom-mobilemenu">
							<i class='bx bx-menu'></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header__slider">
		<div class="swiper mySwiper ">
			<div class="swiper-wrapper">
				<div class="swiper-slide .header__slider-imgs">
					<img src="${base}/img/slider-1.jpg" alt=""
						class="header__slider-img">
				</div>
				<div class="swiper-slide .header__slider-imgs">
					<img src="${base}/img/slider-2.jpg" alt=""
						class="header__slider-img">
				</div>
				<div class="swiper-slide .header__slider-imgs">
					<img src="${base}/img/slider-3.jpg" alt=""
						class="header__slider-img">
				</div>
				<div class="swiper-slide .header__slider-imgs">
					<img src="${base}/img/slider-4.jpg" alt=""
						class="header__slider-img">
				</div>
			</div>
			<div class="swiper-button-next next"></div>
			<div class="swiper-button-prev prev"></div>
		</div>
	</div>
</header>