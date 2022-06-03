package com.devpro.shoppet.controller.customer;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shoppet.controller.BaseController;
import com.devpro.shoppet.entities.SaleOrder;
import com.devpro.shoppet.entities.SaleOrderProducts;
import com.devpro.shoppet.entities.User;
import com.devpro.shoppet.service.SaleOrderService;
import com.devpro.shoppet.service.UserService;


@Controller
public class ProfileController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = { "/profile/{id}" }, method = RequestMethod.GET)

	public String profile(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("id") int id)
			throws IOException {
		
		SaleOrder saleOrder = saleOrderService.loadSale(id);
		
		model.addAttribute("saleOderID", saleOrder);
		
		if(saleOrder != null) {
			
			Set<SaleOrderProducts> saleIndb = saleOrder.getSaleOrderProducts();
			model.addAttribute("saleOderIndb", saleIndb);
		}
		
		model.addAttribute("profile", new User());
		
		return "customer/profile";
	}
	
	@RequestMapping(value = { "/profile" }, method = RequestMethod.POST)

	public String profilePost(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@ModelAttribute("profile") User user	)
			throws IOException {
		
		userService.addProfile(user);
		
		return "redirect:/";
	}
}
