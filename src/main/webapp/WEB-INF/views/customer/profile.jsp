<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tài khoản</title>
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
					<div class="bread-crumb">
						<span><a href="${base }/">Trang chủ</a></span> <span><a
							href="${base }/contact">Tài khoản</a></span>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-6">
						<div class="contact__title"
							style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">
							<h2>Thông tin tài khoản:</h2>
						</div>
						<div class="contact__form">
							<sf:form class="form" action="${base }/profile" method="post"
								modelAttribute="profile">

								<sf:input path="id" name="id" type="hidden"
									value="${userLogined.id }" />


								<div class="contact__form-input" style="margin-bottom: 20px;">
									<p
										style="margin-bottom: 5px; margin-left: 10px; font-size: 16px;">Tên
										khách hàng:</p>
									<sf:input type="text" path="username" name="username"
										class="form-input" placeholder="Your name..."
										value="${userLogined.username }" />
								</div>

								<div class="contact__form-input" style="margin-bottom: 20px;">
									<p
										style="margin-bottom: 5px; margin-left: 10px; font-size: 16px;">Email:
									</p>
									<sf:input type="email" path="email" name="email"
										class="form-input" placeholder="Email..."
										value="${userLogined.email }" />
								</div>

								<div class="contact__form-input" style="margin-bottom: 20px;">
									<p
										style="margin-bottom: 5px; margin-left: 10px; font-size: 16px;">Địa
										chỉ:</p>
									<sf:input type="text" path="address" name="address"
										class="form-input" placeholder="Address..."
										value="${userLogined.address }" />
								</div>

								<div class="contact__form-input" style="margin-bottom: 20px;">
									<p
										style="margin-bottom: 5px; margin-left: 10px; font-size: 16px;">Số
										điện thoại:</p>
									<sf:input type="text" path="phone" name="phone"
										class="form-input" placeholder="Phone..."
										value="${userLogined.phone }" />
								</div>

								<div class="contact__btn">
									<button
										style="margin-bottom: 20px; float: right; padding: 8px 16px; border-radius: 8px; border: none; background-color: #f6ab49"
										type="submit">Lưu</button>
								</div>
							</sf:form>
						</div>
					</div>

					<div class="col-6">
						<div class="contact__title"
							style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">
							<h2>Lịch sử mua hàng:</h2>
						</div>

						<c:choose>
							<c:when test="${saleOderID == null}">
								<p
									style="font-size: 20px; font-weight: bold; text-align: center; margin: 20px 0;">Chưa
									có đơn hàng!</p>
								<a href="${base }/danh-muc"
									style="padding: 8px 5px;margin-left:250px ; background: #f6ab49; border-radius: 8px;">Đi
									đến cửa hàng</a>
							</c:when>
							<c:otherwise>
								<div>
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col">Tên sản phẩm</th>
												<th scope="col">Giá thành</th>
												<th scope="col">Số lượng</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${saleOderIndb }" var="saleOderIndb">
												<tr>

													<td><c:out value="${saleOderIndb.product.title }" /></td>
													<td><c:choose>
															<c:when test="${saleOderIndb.product.priceSale == 0 }">
																<p>
																	<fmt:setLocale value="vi_VN" />
																	<fmt:formatNumber value="${saleOderIndb.product.price}" />
																	đ
																</p>
															</c:when>

															<c:otherwise>
																<p>
																	<fmt:setLocale value="vi_VN" />
																	<fmt:formatNumber
																		value="${saleOderIndb.product.priceSale}" />
																	đ
																</p>
															</c:otherwise>

														</c:choose></td>
													<td><c:out value="${saleOderIndb.quality }" /></td>
												</tr>
											</c:forEach>


										</tbody>
									</table>
								</div>
								<div class="contact__title"
									style="float: right; font-size: 20px; font-weight: bold; margin: 20px 0;">
									<h2>
										Tổng tiền:
										<fmt:setLocale value="vi_VN" />
										<fmt:formatNumber value="${saleOderID.total}" />
										đ
									</h2>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</main>
	</div>

	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<div class="scroll__top">
		<i class='bx bx-up-arrow-alt'></i>
	</div>

	<jsp:include page="/WEB-INF/views/customer/layout/headerMobile.jsp"></jsp:include>

	</div>

	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</body>

</html>