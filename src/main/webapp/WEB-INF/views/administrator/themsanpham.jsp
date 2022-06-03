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
								<sf:form modelAttribute="product"
									action="${base}/admin/them-san-pham" method="post"
									enctype="multipart/form-data">

									<sf:hidden path="id" />

									<h4 class="card-title">Danh mục</h4>
									<div class="form-group">
									
										<sf:select path="categories.id" class="custom-select mr-sm-2"
											id="inlineFormCustomSelect">
										
											<sf:options items="${categories }" itemValue="id"
												itemLabel="name" />
												
										</sf:select>
										
									</div>

									<h4 class="card-title">Title</h4>
									<div class="form-group">
										<sf:input path="title" name="title" type="text"
											class="form-control"></sf:input>
									</div>

									<h4 class="card-title">Price</h4>
									<div class="form-group">
										<sf:input path="price" name="price" type="text"
											class="form-control"></sf:input>
									</div>

									<h4 class="card-title">Price Sale</h4>
									<div class="form-group">
										<sf:input path="priceSale" name="priceSale" type="text"
											class="form-control"></sf:input>
									</div>


									<div class="form-group">
										<sf:checkbox path="isHot" id="isHot" />
										<label class="form_checkbox" for="isHot">Sản phẩm nổi
											bật?</label>
									</div>

									<h4 class="card-title">File Avatar</h4>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Upload</span> <input
												type="file" class="custom-file-input" id="inputGroupFile01"
												name="productAvatar"> <label
												class="custom-file-label" for="inputGroupFile01">Choose
												file</label>
										</div>
									</div>

									<h4 class="card-title">File Upload</h4>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Upload</span> <input
												type="file" class="custom-file-input" id="inputGroupFile02"
												name="productPictures" multiple="multiple"> <label
												class="custom-file-label" for="inputGroupFile02">Choose
												file</label>
										</div>
									</div>

									<h4 class="card-title">Short description</h4>
									<div class="form-group">
										<sf:textarea path="shortDes" id="description_sum"
											name="shortDes" class="form-control" rows="4"
											placeholder="Text Here..."></sf:textarea>
									</div>

									<h4 class="card-title">Description</h4>
									<div class="form-group">
										<sf:textarea path="details" id="description_sum2"
											name="details" class="form-control" rows="4"
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
			$('#description_sum').summernote();
			$('#description_sum2').summernote();
		});
	</script>

</body>

</html>