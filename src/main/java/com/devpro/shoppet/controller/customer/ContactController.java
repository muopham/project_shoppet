package com.devpro.shoppet.controller.customer;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shoppet.controller.BaseController;
import com.devpro.shoppet.dto.Subscribe;
import com.devpro.shoppet.entities.Contact;
import com.devpro.shoppet.service.ContactService;

@Controller
public class ContactController extends BaseController {

	@Autowired
	private ContactService contactService;

	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		Contact contact = new Contact();

		model.addAttribute("model_contact", contact);

		return "customer/contact";
	}

	// Dạng 1:
	// @RequestMapping(value = { "/contact" }, method = RequestMethod.POST)

	// public String simpleContact(final Model model, final HttpServletRequest
	// request, final HttpServletResponse response)
	// throws IOException {

	// String fullName = request.getParameter("fullName");
	// String email = request.getParameter("email");
	// String message = request.getParameter("message");

	// System.out.println(fullName);
	// System.out.println(email);
	// System.out.println(message);
	// return "customer/contact";
	// }

	// Dạng 2:
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)

	public String contact_form(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			final @ModelAttribute("model_contact") Contact contact) throws IOException {

		contactService.saveOrUpdate(contact);

		sendEmail(contact.getEmail(), "ShopPet", "Cảm ơn bạn đã liên hệ!");

		// reset
		model.addAttribute("model_contact", new Contact());

		return "customer/contact";
	}

	// Dạng 3:
	// @RequestMapping(value = { "/ajax/contact" }, method = RequestMethod.POST)
	//
	// public ResponseEntity<Map<String, Object>> ajax_contact(final Model model,
	// final HttpServletRequest request,
	// final HttpServletResponse response,
	// final @RequestBody Contact contact) {
	//
	// System.out.println(contact.getFullName());
	// System.out.println(contact.getEmail());
	// System.out.println(contact.getMessage());
	//
	// Map<String, Object> jsonResult = new HashMap<String, Object>();
	// jsonResult.put("code", 200);
	// jsonResult.put("message", "Cảm ơn bạn" + contact.getEmail());
	// return ResponseEntity.ok(jsonResult);
	// }

	@RequestMapping(value = { "/ajax/contact" }, method = RequestMethod.POST)

	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Subscribe subscribe) {
		
		sendEmail(subscribe.getEmailSub(), "ShopPet", "Cảm ơn bạn đã đăng ký!");
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		return ResponseEntity.ok(jsonResult);
	}
}
