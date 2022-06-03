package com.devpro.shoppet.controller.adminstrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shoppet.controller.BaseController;
import com.devpro.shoppet.dto.ProductSearchModel;
import com.devpro.shoppet.entities.Product;
import com.devpro.shoppet.service.ProductService;

@Controller
public class AdminProductController extends BaseController{
	
	@Autowired
	private ProductService productService;
	
//	search trong danh sách sản phẩm
	@RequestMapping(value = { "/admin/danh-sach-san-pham" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
			
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.categoryId = getInteger(request, "categoryId");
		searchModel.setPage(getCurrentPage(request));
		
		model.addAttribute("products", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		
		return "administrator/danhsachsanpham";
	}
	
	
	@RequestMapping(value = { "/admin/them-san-pham" }, method = RequestMethod.GET)

	public String themSanPham(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		model.addAttribute("product", new Product());
				
		return "administrator/themsanpham";
	}
	
	@RequestMapping(value = { "/admin/them-san-pham/{productID}" }, method = RequestMethod.GET)

	public String getProductByID(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productID") int productID
			)
			throws IOException {
		
//		lấy sp trong db
		Product product = productService.getById(productID);
		
		model.addAttribute("product", product);
		
		return "administrator/themsanpham";
	}
	
	
	@RequestMapping(value = { "/admin/product/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody Product product) {
		
		Product productInDb = productService.getById(product.getId());
		productInDb.setStatus(false);
		productService.saveOrUpdate(productInDb);
		
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/admin/them-san-pham" }, method = RequestMethod.POST)

	public String themSanPham_form(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product,
			@RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productPictures") MultipartFile[] productPictures)
			throws IOException {
	
		if (product.getId() == null || product.getId() <= 0) { // thêm mới
			productService.add(product, productAvatar, productPictures);
		}
		else
		{ // chỉnh sửa
			productService.update(product, productAvatar, productPictures);
		}		
		
		return "redirect:/admin/danh-sach-san-pham";
	}
//		lưu ảnh trên server
//		attachmentFile.transferTo(new File("C:/upload/" + attachmentFile.getOriginalFilename()));
}
