<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Login</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
<link rel="stylesheet" href="${base }/css/login.css">
</head>
<body>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<sf:form action="${base }/login" method="post"
				modelAttribute="create_account">

				<h1>Create Account</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your email for registration</span>
				<sf:input type="text" placeholder="Name" name="username"
					path="username" />
				<sf:input type="email" placeholder="Email" name="email" path="email" />
				<sf:input type="password" placeholder="Password" name="password"
					path="password" />
				<button type="submit">Sign Up</button>
			</sf:form>
		</div>


		<div class="form-container sign-in-container">
			<form method="POST" action="${base }/perform_login">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<h1>Sign in</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>

				<!-- kiểm tra xem đã login thành công hay không, bằng cách kiểm tra biến login_error -->
				<c:if test="${not empty param.login_error}">
					<div style="font-size: 14px;" class="alert alert-danger" role="alert">Đăng nhập không
						thành công. Thử lại!!!</div>
				</c:if>

				<input type="text" name="username" placeholder="Username" /> <input
					type="password" name="password" placeholder="Password" />
				<div style="display: flex;">
					<input style="display: inline;" type="checkbox" name="remember-me" />
					<p style="margin: 0;">Remember me</p>
				</div>
				<a href="${base }/forgot-password">Forgot your password?</a>
				<button type="submit">Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>Vui lòng đăng nhập bằng thông tin cá nhân của bạn</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Vui lòng đăng nhập bằng thông tin cá nhân của bạn</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${base }/js/login.js"></script>
</body>
</html>