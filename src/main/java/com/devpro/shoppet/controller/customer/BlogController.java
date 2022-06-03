package com.devpro.shoppet.controller.customer;

import java.io.IOException;

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
import com.devpro.shoppet.entities.Blog;
import com.devpro.shoppet.service.BlogService;
import com.devpro.shoppet.service.PagerData;

@Controller
public class BlogController extends BaseController{
	
	@Autowired
	private BlogService blogService;
	
	
	@RequestMapping(value = { "/tin-tuc" }, method = RequestMethod.GET)

	public String blogList(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
			
		model.addAttribute("blogs", blogService.findAll() );
		
		
		return "customer/blogList";
	}
	
	@RequestMapping(value = { "/tin-tuc/{blogSeo}" }, method = RequestMethod.GET)
	public String blogDetail(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("blogSeo") String blogSeo) throws IOException {
		
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.seo = blogSeo;

		PagerData<Blog> blogs = blogService.search(searchModel);
		Blog blog = blogs.getData().get(0);	
		
		model.addAttribute("blog", blog);

		return "customer/blogDetail";
	}
	
}
