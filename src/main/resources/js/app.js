// Search btn
$(document).ready(function() {
	$('.header__bottom-search').click(function() {
		$('.header__box').fadeToggle();
		$('.header__box').click(function(e) {
			e.stopPropagation();
		});
	});
	$('.header__bottom-cart').click(function() {
		$('.header__box-cart').fadeToggle();
		$('.header__box-cart').click(function(e) {
			e.stopPropagation();
		});
	});
});

// Sticky header
var height = $('.header__top').height();
$(window).scroll(function() {
	if ($(this).scrollTop() > height) {
		$('.header__bottom').addClass('sticky');
	} else {
		$('.header__bottom').removeClass('sticky');
	}
});

// Scroll
$(document).ready(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 400) {
			$('.scroll__top').fadeIn();
		}
		else {
			$('.scroll__top').fadeOut();
		}
	});
	$('.scroll__top').click(function() {
		$('html, body').animate({ scrollTop: 0 }, 100);
	})
});

// <!-- Slider -->

var swiper = new Swiper(".mySwiper", {
	slidesPerView: 1,
	spaceBetween: 30,
	loop: true,
	autoplay: {
		delay: 2000,
	},
	navigation: {
		nextEl: ".next",
		prevEl: ".prev",
	},
});


// <!-- slider-product -->

var swiper2 = new Swiper(".myProduct", {
	slidesPerView: 1,
	spaceBetween: 30,
	loop: true,
	pagination: {
		el: ".swiper-pagination",
		clickable: true,
	},
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},
});


//  Slide Related 
var swiper3 = new Swiper(".myRelated", {
	slidesPerView: 3,
	spaceBetween: 30,
	slidesPerGroup: 3,
	loop: true,
	loopFillGroupWithBlank: true,
	pagination: {
		el: ".swiper-pagination",
		clickable: true,
	},
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},
	breakpoints: {
		// when window width is >= 320px
		320: {
			slidesPerView: 1,
			spaceBetween: 20
		},
		768: {
			slidesPerView: 2,
			spaceBetween: 30
		},
		// when window width is >= 640px
		1200: {
			slidesPerView: 3,
			spaceBetween: 40
		}
	}
});

var swiper4 = new Swiper(".myRelated2", {
	slidesPerView: 4,
	spaceBetween: 30,
	slidesPerGroup: 4,
	loop: true,
	loopFillGroupWithBlank: true,
	autoplay: {
		delay: 4000,
	},
	pagination: {
		el: ".swiper-pagination",
		clickable: true,
	},
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},
	breakpoints: {
		// when window width is >= 320px
		320: {
			slidesPerView: 1,
			spaceBetween: 20
		},
		768: {
			slidesPerView: 2,
			spaceBetween: 30
		},
		// when window width is >= 640px
		1200: {
			slidesPerView: 4,
			spaceBetween: 40
		}
	}
});

// ScrollReveal

var sr = ScrollReveal({
	origin: 'bottom',
	distance: '60px',
	duration: 2000,
	delay: 250
})

sr.reveal(".main__products-hot, .main__products, .main__products-sale, .main__accessory, .main__news, .main__bottom, .footer__top, .main__contact ,.main__map");


// form ajax




function saveSubscribe(baseUrl) { 
	var data = {
		emailSub: jQuery("#idEmailSub").val(), // lay theo id
	};
	alert(jQuery("#idEmailSub").val());
	jQuery.ajax({
		url: baseUrl + "/ajax/contact",
		type: "post",					
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json",
		success: function(jsonResult) {
			alert("C???m ??n b???n ???? ????ng k??!");
		},
		error: function(jqXhr, textStatus, errorMessage) {
			alert("error");
		}
	});
}

// abc
function DeleteProduct(productId, baseUrl) {
	var data = {
		productId: productId,
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/deleteCart", //->request mapping
		type: "post",					//-> method type c???a Request Mapping	
		contentType: "application/json",//-> n???i dung g???i l??n d???ng json
		data: JSON.stringify(data),

		dataType: "json", // ki???u d??? li???u tr??? v??? t??? Controller
		success: function (jsonResult) {

			$(".total").html(jsonResult.totalPrice);
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
			// window.location.reload();
			let test = document.getElementById(`product${productId}`);
			test.style.display= "none";

		},
		error: function (jqXhr, textStatus, errorMessage) {
			alert("error");
		}
	});

}

// Th??m s???n ph???m v??o trong gi??? h??ng
function AddToCart(baseUrl, productId, quanlity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // Id s???n ph???m
		quanlity: quanlity, // S??? l?????ng cho v??o gi??? h??ng
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// t??ng s??? l?????ng s???n ph???m trong gi??? h??ng trong icon

			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
		
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}

// C???p nh???t s??? l?????ng s???n ph???m trong gi??? h??ng
function UpdateQuanlityCart(baseUrl, productId, quanlity) {

	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id	
		quanlity: quanlity
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateQuanlityCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// t??ng s??? l?????ng s???n ph???m trong gi??? h??ng trong icon
			$("#quanlity_" + productId).html(jsonResult.currentProductQuality);
			$("#iconShowTotalItemsInCart").html(jsonResult.totalItems);
			$(".total").html(jsonResult.totalPrice);
			
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}





