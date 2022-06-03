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
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon icon -->
<title>Hóa đơn</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
</head>

<body>
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">

		<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>

		<!-- Wrapper -->
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title text-center mt-2">HÓA ĐƠN MUA HÀNG</h4>

								<p>Họ tên: ${saleOderID.customerName }</p>
								<p>Số điện thoại: ${saleOderID.customerPhone }</p>
								<p>Địa chỉ: ${saleOderID.customerAddress }</p>
								<p>Email: ${saleOderID.customerEmail }</p>

								<h4 class="card-title mt-4">Sản phẩm đã mua</h4>
								<table id="zero_config"
									class="table table-striped table-bordered no-wrap">
									<thead>
										<tr>
											<th>Tên sản phẩm</th>
											<th>Giá thành</th>
											<th>Số lượng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${saleOderIndb }" var="saleOderIndb">
											<tr>
												<td><c:out value="${saleOderIndb.product.title }" /></td>
												<td><c:choose>
															<c:when test="${saleOderIndb.product.priceSale == 0 }">
																<p><c:out value="${saleOderIndb.product.price }" /></p>
															</c:when>

															<c:otherwise>
																<p><c:out value="${saleOderIndb.product.priceSale }" /></p>
															</c:otherwise>

														</c:choose></td>
												<td><c:out value="${saleOderIndb.quality }" /></td>
											</tr>
										</c:forEach>

									</tbody>
									
								</table>
								<h3 style="float: right; color: red">Tổng tiền: <fmt:setLocale value="vi_VN" /> 
																<fmt:formatNumber value="${saleOderID.total}"/> đ</h3>
								<div>
									<c:choose>
										<c:when test="${saleOderID.status == true }">
											<button onclick="ChangeSale(${saleOderID.id});"
												class="btn btn-info">Chờ xác nhận</button>
										</c:when>

										<c:otherwise>
											<span class="btn btn-success">Đã thanh toán</span>
										</c:otherwise>

									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
	<script type="text/javascript">

						function ChangeSale(saleOderID) {
							// tạo javascript object.  
							var data = {
								id: saleOderID,
							};

							// $ === jQuery
							// json == javascript object
							jQuery.ajax({
								url: '${base}' + "/admin/change-sale", //->request mapping
								type: "post",					//-> method type của Request Mapping	
								contentType: "application/json",//-> nội dung gửi lên dạng json
								data: JSON.stringify(data),

								dataType: "json", // kiểu dữ liệu trả về từ Controller
								success: function (jsonResult) {
									alert(jsonResult.message);
									window.location.reload();
								},
								error: function (jqXhr, textStatus, errorMessage) {
									alert("error");
								}
							});

						}

					</script>

</body>

</html>