<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>ShopPet</title>
<!-- Favicon icon -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
</head>

<body>
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">

		<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
		<!-- wrapper -->
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">

								<!-- form -->
								<sf:form modelAttribute="categorys"
									action="${base}/admin/them-danh-muc" method="post">

									<sf:hidden path="id" />
									
									<h4 class="card-title">Title</h4>
									<div class="form-group">
										<sf:input path="name" name="name" type="text"
											class="form-control"></sf:input>
									</div>

									<h4 class="card-title">Description</h4>
									<div class="form-group">
										<sf:textarea id="description_sum2" path="description"
											name="description" class="form-control" rows="4"
											placeholder="Text Here..."></sf:textarea>
									</div>

									<button type="submit"
										class="btn waves-effect waves-light btn-rounded btn-primary">Save</button>
								</sf:form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#description_sum2').summernote();
		});
	</script>

</body>

</html>