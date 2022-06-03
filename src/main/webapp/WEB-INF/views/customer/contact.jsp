<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Liên hệ</title>
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
							href="${base }/contact">Liên hệ</a></span>
					</div>
				</div>
			</div>
			<div class="main__contact">
				<div class="container">
					<div class="row">
						<div class="col-12 col-lg-6">
							<div class="contact__title">
								<h2 class="title">Liên lạc</h2>
							</div>
							<div class="contact__form">

								<!-- Dạng 2: Spring-form -->
								<sf:form modelAttribute="model_contact" class="form"
									method="post" action="${base}/contact">
									<div class="row">
										<div class="col-md-6">
											<div class="contact__form-input">
												<sf:input path="fullName" type="text" name="fullName"
													class="form-input" placeholder="Name..." value="${userLogined.username }" ></sf:input>
											</div>
										</div>
										<div class="col-md-6">
											<div class="contact__form-input">
												<sf:input path="email" type="email" name="email"
													class="form-input" placeholder="Email..." value="${userLogined.email }"></sf:input>
											</div>
										</div>
										<div class="col-12">
											<div class="contact__form-input">
												<sf:textarea path="message" cols="30" rows="5"
													class="form__textarea" name="message" placeholder="Message"></sf:textarea>
											</div>
										</div>
										<div class="col-12">
											<div class="contact__btn">
												<button type="submit">Send</button>
											</div>
										</div>
									</div>
								</sf:form>

								<!-- Dạng 3: Ajax -->
								<!-- <form class="form" action="${base}/contact">
												<div class="row">
													<div class="col-md-6">
														<div class="contact__form-input">
															<input type="text" id="idFullName" name="fullName"
																class="form-input" placeholder="Your name..." required>
														</div>
													</div>
													<div class="col-md-6">
														<div class="contact__form-input">
															<input type="email" id="idEmail" 
															name="email" class="form-input" placeholder="Email..." required>
														</div>
													</div>
													<div class="col-12">
														<div class="contact__form-input">
															<textarea id="idMessage" cols="30" rows="5"
																class="form__textarea" name="message"
																placeholder="Message" required></textarea>
														</div>
													</div>
													<div class="col-12">
														<div class="contact__btn">
															<button type="button" onclick="saveContact( '${base}'
															)">Send</button>
														</div>
													</div>
												</div>
											</form> -->
							</div>
						</div>
						<div class="col-12 col-lg-6">
							<div class="contact__title">
								<h2 class="title">Liên hệ với chúng tôi</h2>
							</div>
							<p class="contact__description">Lorem ipsum dolor sit amet
								consectetur adipisicing elit. Voluptate facere aliquid quibusdam
								provident laudantium veniam iste magni doloribus ipsam porro
								similique, quisquam temporibus, quod ipsa obcaecati tempora.
								Doloribus, corporis impedit! Lorem, ipsum dolor sit amet
								consectetur adipisicing elit. Id ducimus sed voluptates sequi
								adipisci aspernatur, veniam libero dolor harum eaque consectetur
								officia iusto aut officiis quas est animi nam autem.</p>
							<ul class="contact__address">
								<li><i class='bx bx-phone'></i> 012345678</li>
								<li><i class='bx bx-envelope'></i> mail@gmail.com</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="main__map">
				<div class="row">
					<div class="col-12">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1612.1966650274296!2d105.78817454726801!3d20.980166368165296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acce762c2bb9%3A0xbb64e14683ccd786!2zSOG7jWMgVmnhu4duIENOIELGsHUgQ2jDrW5oIFZp4buFbiBUaMO0bmcgLSBIw6AgxJDDtG5n!5e0!3m2!1svi!2s!4v1647935982673!5m2!1svi!2s"
							width="100%" height="450" style="border: 0;" allowfullscreen=""
							loading="lazy"></iframe>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
		<div class="scroll__top">
			<i class='bx bx-up-arrow-alt'></i>
		</div>

		<jsp:include page="/WEB-INF/views/customer/layout/headerMobile.jsp"></jsp:include>
		
	</div>

	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</body>

</html>