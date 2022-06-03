package com.devpro.shoppet.controller.adminstrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shoppet.controller.BaseController;
import com.devpro.shoppet.service.ContactService;

@Controller
public class AdminContactController extends BaseController{
	
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = { "/admin/danh-sach-lien-he" }, method = RequestMethod.GET)
	public String adminContactList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		model.addAttribute("contact", contactService.findAll());
		
		return "administrator/danhsachlienhe";
	}
	
}
