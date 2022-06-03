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
import com.devpro.shoppet.entities.Blog;
import com.devpro.shoppet.service.BlogService;

@Controller
public class AdminBlogController extends BaseController{
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping(value = { "/admin/them-tin-tuc" }, method = RequestMethod.GET)

	public String themTinTuc(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		model.addAttribute("blog", new Blog());
				
		return "administrator/themtintuc";
	}
	
	@RequestMapping(value = { "/admin/them-tin-tuc/{blogID}" }, method = RequestMethod.GET)

	public String getBlogByID(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("blogID") int blogID
			)
			throws IOException {
		
//		lấy sp trong db
		Blog blog = blogService.getById(blogID);
		
		model.addAttribute("blog", blog);
		
		return "administrator/themtintuc";
	}
	
	@RequestMapping(value = { "/admin/blog/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteBLog(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody Blog blog) {
		
		Blog blogInDb = blogService.getById(blog.getId());
		blogInDb.setStatus(false);
		blogService.saveOrUpdate(blogInDb);
		
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/admin/them-tin-tuc" }, method = RequestMethod.POST)

	public String themSanPham_form(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("blog") Blog blog,
			@RequestParam("blogAvatar") MultipartFile blogAvatar
			)
			throws IOException {
	
		if (blog.getId() == null || blog.getId() <= 0) { // thêm mới
			blogService.add(blog, blogAvatar);
		}
		else
		{ // chỉnh sửa
			blogService.update(blog, blogAvatar);
		}		
		
		return "redirect:/admin/danh-sach-tin-tuc";
	}
	
	@RequestMapping(value = { "/admin/danh-sach-tin-tuc" }, method = RequestMethod.GET)
	public String adminBlogList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
			
		model.addAttribute("blog", blogService.findAll());
		
		return "administrator/danhsachtintuc";
	}
}
