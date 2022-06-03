<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
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
						<title>Danh sách User</title>
						<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
						<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
					</head>

					<body>
						<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6"
							data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed"
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

														<div class="col-md-12">
															<p>
																<a class="btn btn-info" data-toggle="collapse"
																	href="#collapseExample" aria-expanded="false"
																	aria-controls="collapseExample"> Thêm tài khoản </a>
															</p>
															<div class="collapse" id="collapseExample">
																<div class="card card-body">
																	<h2 class="mt-3 text-center">Tạo tài khoản</h2>

																	<sf:form class="mt-4"
																		action="${base }/admin/danh-sach-user"
																		method="post" modelAttribute="create_account">
																		<div class="row">
																			<div class="col-lg-12">
																				<div class="form-group">
																					<sf:input class="form-control"
																						type="text" placeholder="Name"
																						name="username"
																						path="username" />
																				</div>
																			</div>
																			<div class="col-lg-12">
																				<div class="form-group">
																					<sf:input class="form-control"
																						type="email" placeholder="Email"
																						name="email" path="email" />
																				</div>
																			</div>
																			<div class="col-lg-12">
																				<div class="form-group">
																					<sf:input class="form-control"
																						type="password"
																						placeholder="Password"
																						name="password"
																						path="password" />
																				</div>
																			</div>
																			<div class="col-lg-12 text-center">
																				<button type="submit"
																					class="btn btn-block btn-primary">Đăng
																					ký</button>
																			</div>

																		</div>
																	</sf:form>
																</div>
															</div>
														</div>

														<table id="zero_config"
															class="table table-striped table-bordered no-wrap">
															<thead>
																<tr>
																	<th>UserName</th>
																	<th>Email</th>
																	<th>Điện thoại</th>
																	<th>Địa chỉ</th>
																	<th>Role</th>
																	<th>Action</th>
																</tr>
															</thead>
															<tbody>

																<c:forEach items="${users }" var="user">
																	<tr>
																		<td>
																			<c:out value="${user.username }" />
																		</td>
																		<td>
																			<c:out value="${user.email }" />
																		</td>
																		<td>
																			<c:out value="${user.phone }" />
																		</td>
																		<td>
																			<c:out value="${user.address }" />
																		</td>
																		<td>
																			<c:forEach items="${user.roles }"
																				var="role">
																				<span>${role.name },</span>
																			</c:forEach>
																		</td>
																		<td><button onclick="ChangeUser(${user.id});"
																				class="btn waves-effect waves-light btn-rounded btn-success">
																				<i class="fas fa-pencil-alt"></i> Cấp
																				quyền admin
																			</button></td>
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

							function ChangeUser(userID) {
								// tạo javascript object.  
								var data = {
									id: userID,
								};

								// $ === jQuery
								// json == javascript object
								jQuery.ajax({
									url: '${base}' + "/admin/changeUser", //->request mapping
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