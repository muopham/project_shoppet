package com.devpro.shoppet.controller.adminstrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import com.devpro.shoppet.entities.Role;
import com.devpro.shoppet.entities.User;
import com.devpro.shoppet.service.RoleService;
import com.devpro.shoppet.service.UserService;

@Controller
public class AdminUserController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = { "/admin/danh-sach-user" }, method = RequestMethod.GET)
	public String adminUserList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		List<User> test = userService.findAll();

		model.addAttribute("users", test);
		
		model.addAttribute("create_account", new User());
		
		return "administrator/danhsachuser";
	}
	
	@RequestMapping(value = { "/admin/danh-sach-user" }, method = RequestMethod.POST)
	public String createAccount(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@ModelAttribute("create_account") User user			
			)
			throws IOException {		
				
		
		userService.add(user);
		
		return "redirect:/admin/danh-sach-user";
	}
	
	@RequestMapping(value = { "/admin/changeUser" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
		
		
		User userIDB = userService.getById(user.getId());		
		Role admin = roleService.getAdminRole();
		userIDB.addRoles(admin);
		
		userService.saveOrUpdate(userIDB);
		
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Cấp quyền thành công");
		return ResponseEntity.ok(jsonResult);
	}
}
