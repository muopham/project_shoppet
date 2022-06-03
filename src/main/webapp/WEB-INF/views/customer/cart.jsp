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

								<c:choose>
									<c:when test="${cart.cartItems == null || totalItems == 0}">
										<div class="cart__empty">
											<p class="title">Giỏ hàng trống!</p>
											<div class="btn-cart">
												<a href="${base }/danh-muc">Đi đến cửa hàng</a>
											</div>
										</div>
									</c:when>

									<c:otherwise>
										<section>
											<div class="container px-4 px-lg-5 mt-5">
												<!-- Shopping cart table -->
												<div class="table-responsive">
													<table class="table">
														<thead>
															<tr>
																<th scope="col" class="border-0 bg-light">
																	<div class="p-2 px-3 text-uppercase">Product</div>
																</th>
																<th scope="col" class="border-0 bg-light">
																	<div class="py-2 text-uppercase">Price</div>
																</th>
																<th scope="col" class="border-0 bg-light">
																	<div class="py-2 text-uppercase">Quantity</div>
																</th>
																<th scope="col" class="border-0 bg-light">
																	<div class="py-2 text-uppercase">Remove</div>
																</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach items="${cart.cartItems }" var="ci">
																<tr id="product${ci.productId}">
																	<th scope="row" class="border-0">
																		<div class="p-2 d-flex">
																			<img src="${base }/upload/${ci.avatar}"
																				alt="" width="70"
																				class="img-fluid rounded shadow-sm">
																			<div
																				style="margin-left: 20px; margin-top: 30px;">
																				<h5 class="mb-0">
																					<a href="#"
																						class="text-dark d-inline-block align-middle">
																						${ci.productName } </a>
																				</h5>
																			</div>
																		</div>
																	</th>
																	<td class="border-0 align-middle"><strong>
																			<fmt:setLocale value="vi_VN" />
																			<fmt:formatNumber value="${ci.priceUnit}" />
																			đ
																		</strong></td>
																	<td class="border-0 align-middle">
																		<button style="border: none"
																			onclick="UpdateQuanlityCart('${base }', ${ci.productId}, -1)"
																			value="-">-</button> <strong><span
																				id="quanlity_${ci.productId}">${ci.quanlity
																				}</span></strong>
																		<button style="border: none"
																			onclick="UpdateQuanlityCart('${base }', ${ci.productId}, 1)"
																			value="+">+</button>
																	</td>
																	<td class="border-0 align-middle">
																		<button
																			onclick="DeleteProduct(${ci.productId}, '${base}');"
																			class="btn btn-danger">
																			<i class='bx bxs-trash'></i>
																		</button>
																	</td>
																</tr>
															</c:forEach>

														</tbody>
													</table>
												</div>
												<!-- End -->

												<form action="${base }/cart/checkout" method="post">

													<div class="row py-5 p-4 bg-white rounded shadow-sm">
														<div class="col-lg-6">

															<div
																class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">
																Customer Info</div>
															<div class="p-4">
																<div class="form-group mb-4">
																	<label for="customerFullName">Tên khách hàng</label> <input
																		type="tel" class="form-control"
																		id="customerFullName" name="customerFullName"
																		value="${userLogined.username }"
																		placeholder="Name">
																</div>
																<div class="form-group mb-4">
																	<label for="customerEmail">Địa chỉ Email</label>
																	<input type="email" class="form-control"
																		id="customerEmail" name="customerEmail"
																		value="${userLogined.email }"
																		placeholder="Email">
																</div>
																<div class="form-group mb-4">
																	<label for="customerPhone">Số điện thoại</label> <input
																		type="tel" class="form-control"
																		id="customerPhone" name="customerPhone"
																		placeholder="Phone"
																		value="${userLogined.phone }">
																</div>
																<div class="form-group">
																	<label for="customerAddress">Địa chỉ nhận hàng</label> <input
																		type="text" class="form-control"
																		id="customerAddress" name="customerAddress"
																		placeholder="Address"
																		value="${userLogined.address }">
																</div>
															</div>
														</div>
														<div class="col-lg-6">
															<div
																class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">
																Order summary</div>
															<div class="p-4">
																<p class="font-italic mb-4">Shipping and additional
																	costs are calculated based on values you have
																	entered.</p>
																<ul class="list-unstyled mb-4">
																	<li
																		class="d-flex justify-content-between py-3 border-bottom">
																		<strong class="text-muted">Order Subtotal
																		</strong><strong class="total">${cart.totalPrice
																			}</strong>
																	</li>
																	<li
																		class="d-flex justify-content-between py-3 border-bottom">
																		<strong class="text-muted">Shipping and
																			handling</strong><strong>$0.00</strong>
																	</li>
																	<li
																		class="d-flex justify-content-between py-3 border-bottom">
																		<strong
																			class="text-muted">Tax</strong><strong>$0.00</strong>
																	</li>
																	<li
																		class="d-flex justify-content-between py-3 border-bottom">
																		<strong class="text-muted">Total</strong>
																		<h5 class="font-weight-bold total">
																			${cart.totalPrice}</h5>
																	</li>
																</ul>
																<button type="submit"
																	class="btn btn-warning rounded-pill py-2 btn-block">Mua
																	hàng</button>
															</div>
														</div>
													</div>

												</form>

											</div>

										</section>
									</c:otherwise>
								</c:choose>


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