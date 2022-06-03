package com.devpro.shoppet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shoppet.entities.User;
import com.devpro.shoppet.service.UserService;

@Controller
public class LoginController extends BaseController  {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		model.addAttribute("create_account", new User());
		
		return "login";
	}
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public String createAccount(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@ModelAttribute("create_account") User user
			
			)
			throws IOException {		
								
		userService.add(user);
		
		return "redirect:/login";
	}
}
