package com.devpro.shoppet.controller.adminstrator;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shoppet.conf.Utilities;
import com.devpro.shoppet.entities.SaleOrder;
import com.devpro.shoppet.entities.User;
import com.devpro.shoppet.service.SaleOrderService;
import com.devpro.shoppet.service.UserService;

@Controller
public class AdminHomeController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)

	public String homeAdmin(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		List<User> user = userService.findAll();
		int userList = user.size();
		
		List<SaleOrder> saleOrder = saleOrderService.findAll();
		int saleOrderList = saleOrder.size();
		
		BigDecimal total = BigDecimal.ZERO;
		for (SaleOrder saleOrder2 : saleOrder) {
			total = total.add(saleOrder2.getTotal());
		}
		
		model.addAttribute("total", Utilities.formatCurrency(total));
		model.addAttribute("saleOrderList", saleOrderList);
		model.addAttribute("userList", userList);
		
		return "administrator/index";
	}
		
}
