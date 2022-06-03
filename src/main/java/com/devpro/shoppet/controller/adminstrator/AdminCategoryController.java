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

import com.devpro.shoppet.controller.BaseController;
import com.devpro.shoppet.entities.Categories;
import com.devpro.shoppet.service.CategoriesService;

@Controller
public class AdminCategoryController extends BaseController {

	@Autowired
	private CategoriesService categoriesService;

	@RequestMapping(value = { "/admin/danh-sach-danh-muc" }, method = RequestMethod.GET)
	public String adminCategoryList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		return "administrator/danhsachdanhmuc";
	}

	@RequestMapping(value = { "/admin/them-danh-muc" }, method = RequestMethod.GET)
	public String adminAddCategory(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		model.addAttribute("categorys", new Categories());

		return "administrator/themdanhmuc";
	}

	@RequestMapping(value = { "/admin/them-danh-muc" }, method = RequestMethod.POST)

	public String themDanhMuc_form(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("categorys") Categories categories) throws IOException {
			
		if (categories.getId() == null || categories.getId() <= 0) {
			
			categoriesService.add(categories);
			
		}else {
			
			categoriesService.update(categories);
		}

		model.addAttribute("category", new Categories());

		return "redirect:/admin/danh-sach-danh-muc";
	}
	
	@RequestMapping(value = { "/admin/them-danh-muc/{categoryID}" }, method = RequestMethod.GET)

	public String getCategoryByID(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("categoryID") int categoryID) throws IOException {

		Categories categories = categoriesService.getById(categoryID);

		model.addAttribute("categorys", categories);

		return "administrator/themdanhmuc";
	}
	
	@RequestMapping(value = { "/admin/category/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody Categories categories) {
		Categories categoryInDb = categoriesService.getById(categories.getId());
		categoryInDb.setStatus(false);
		categoriesService.saveOrUpdate(categoryInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
	}
}
