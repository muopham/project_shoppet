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
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<title>Sản phẩm</title>
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
								<div class="table-responsive">

									<form class="form-inline"
										action="${base }/admin/danh-sach-san-pham" method="get">

										<div class="d-flex flex-row justify-content-between mt-4 mb-4">
											<div class="d-flex flex-row">

												<input type="hidden" id="page" name="page"
													class="form-control"> <input type="text"
													id="keyword" name="keyword" class="form-control"
													placeholder="Search" value="${searchModel.keyword }"
													style="margin-right: 5px;"> <select
													class="form-control" name="categoryId" id="categoryId"
													style="margin-right: 5px;">
													<option value="0">All</option>
													<c:forEach items="${categories}" var="category">
														<option value="${category.id }">${category.name
																			}</option>
													</c:forEach>
												</select>
												<button type="submit" id="btnSearch" name="btnSearch"
													value="Search" class="btn btn-primary">Seach</button>
											</div>
										</div>
										<table id="zero_config"
											class="table table-striped table-bordered no-wrap">
											<thead>
												<tr>
													<th>Id</th>
													<th>Tên sản phẩm</th>
													<th>Ảnh</th>
													<th>Giá</th>
													<th>Giá sale</th>
													<th>Trạng thái</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${products.data }" var="product">
													<tr>
														<td><c:out value="${product.id }" /></td>
														<td><c:out value="${product.title }" /></td>
														<td><img style="width: 100px;"
															src="${base }/upload/${product.avatar}"></td>
														<td><c:out value="${product.price }" /></td>
														<td><c:out value="${product.priceSale }" /></td>
														<td><c:choose>
																<c:when test="${product.status }">
																	<input type="checkbox" checked="checked"
																		readonly="readonly">
																</c:when>
																<c:otherwise>
																	<input type="checkbox" readonly="readonly">
																</c:otherwise>
															</c:choose></td>
														<td><a
															href="${base }/admin/them-san-pham/${product.id }"
															class="btn waves-effect waves-light btn-rounded btn-success">
																<i class="fas fa-pencil-alt"></i>
														</a> <a onclick="DeleteProduct(${product.id});"
															class="btn waves-effect waves-light btn-rounded btn-danger ml-2 ml-2">
																<i class="fas fa-trash-alt"></i>
														</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- Paging -->
										<div class="row">
											<div class="col-12 d-flex justify-content-center">
												<div id="paging"></div>
											</div>
										</div>
									</form>

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
						function DeleteProduct(productId) {
							// tạo javascript object.  
							var data = {
								id: productId,
							};

							// $ === jQuery
							// json == javascript object
							jQuery.ajax({
								url: '${base}' + "/admin/product/delete", //->request mapping
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
					</script>
</body>

</html>