package com.devpro.shoppet.controller.customer;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shoppet.controller.BaseController;
import com.devpro.shoppet.dto.ProductSearchModel;
import com.devpro.shoppet.entities.Categories;
import com.devpro.shoppet.entities.Product;
import com.devpro.shoppet.entities.ProductImages;
import com.devpro.shoppet.service.BlogService;
import com.devpro.shoppet.service.CategoriesService;
import com.devpro.shoppet.service.PagerData;
import com.devpro.shoppet.service.ProductService;

//Định nghĩa 1 Bean(dành cho Controller trong mô hình MVC)
@Controller

public class HomeController extends BaseController{

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
	private BlogService blogService;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)

	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		model.addAttribute("blogs", blogService.findAll());
		
		model.addAttribute("products", productService.findAll());

		return "customer/index";
	}

	
	@RequestMapping(value = { "/danh-muc" }, method = RequestMethod.GET)

	public String danhMuc(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.isHot = request.getParameter("isHot");		
		searchModel.categoryId = getInteger(request, "categoryId");
		searchModel.sortField = request.getParameter("sortField");
		searchModel.sortDir = request.getParameter("sortDir");
		searchModel.sortPrice = getInteger(request, "sortPrice");
		
		searchModel.setPage(getCurrentPage(request));

		model.addAttribute("products", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "customer/danhmuc";
	}
	
	@RequestMapping(value = { "/danh-muc/{categorySeo}" }, method = RequestMethod.GET)

	public String danhMucByCategory(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response, 
			@PathVariable("categorySeo") String categorySeo)
			throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setPage(getCurrentPage(request));
		searchModel.seo = categorySeo;
		
		PagerData<Categories> cate = categoriesService.search(searchModel);
		Categories categoryIDb = cate.getData().get(0);
		Categories category = categoriesService.getById(categoryIDb.getId());
		Set<Product> productInDB = category.getProducts();
		
		model.addAttribute("productByCate", productInDB);

		
		return "customer/danhmucByCate";
	}

	@RequestMapping(value = { "/danh-muc/san-pham/{productSeo}" }, method = RequestMethod.GET)

	public String sanPham(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productSeo") String productSeo) throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.seo = productSeo;

		PagerData<Product> products = productService.search(searchModel);
		Product product = products.getData().get(0);
		
		Set<ProductImages> productImg = products.getData().get(0).getProductImages();
		
		model.addAttribute("product", product);
		model.addAttribute("productImg", productImg);
		
//		 lấy tất cả sp
		model.addAttribute("products", productService.findAll());

		return "customer/sanpham";
	}

}