package com.devpro.shoppet.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shoppet.controller.BaseController;
import com.devpro.shoppet.entities.User;
import com.devpro.shoppet.service.UserService;

@Controller
public class PasswordController extends BaseController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/forgot-password" }, method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		return "password";
	}

	@RequestMapping(value = { "/forgot-password" }, method = RequestMethod.POST)
	public String sendEmail(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		String email = request.getParameter("email");
		String message = "";
		List<User> listUser = userService.findAll();
		for (User user : listUser) {
			if (user.getEmail().compareToIgnoreCase(email.trim()) == 0) {
				
				String ramdom = randomPassword();
				String newPassword = new BCryptPasswordEncoder(4).encode(ramdom);
				
				user.setPassword(newPassword);
				message = "Mật khẩu mới đã được gửi đến gmail!";
				
				String mainContent = "Xin chào: " + user.getUsername() + "\n";
				mainContent += "Mật khẩu mới của bạn là: " + ramdom;
				
				sendEmail(email, "Xác nhận thay đổi mật khẩu!", mainContent);
				

				userService.saveOrUpdate(user);
			}
			else {
				message = "Email không chính xác!";
			}
		}
	
		model.addAttribute("message", message);
		
		return "password";
	}
}
