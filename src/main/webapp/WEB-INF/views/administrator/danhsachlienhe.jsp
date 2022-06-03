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
<title>Danh sách liên hệ</title>
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


									<table id="zero_config"
										class="table table-striped table-bordered no-wrap">
										<thead>
											<tr>
												<th>Tên liên hệ</th>
												<th>Email</th>
												<th>Message</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${contact }" var="contact">
												<tr>
													<td><c:out value="${contact.fullName }" /></td>
													<td><c:out value="${contact.email }" /></td>
													<td><c:out value="${contact.message }" /></td>
													<td><a href=""
														class="btn waves-effect waves-light btn-rounded btn-success">
															<i class="fas fa-pencil-alt"></i>
													</a> <a
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


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>

</body>

</html>