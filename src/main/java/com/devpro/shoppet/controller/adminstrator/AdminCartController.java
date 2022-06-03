package com.devpro.shoppet.controller.adminstrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shoppet.controller.BaseController;
import com.devpro.shoppet.entities.SaleOrder;
import com.devpro.shoppet.entities.SaleOrderProducts;
import com.devpro.shoppet.service.SaleOrderService;

@Controller
public class AdminCartController extends BaseController{
	
	@Autowired
	private SaleOrderService saleOrderService;

	@RequestMapping(value = { "/admin/view-order" }, method = RequestMethod.GET)
	public String orderList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		model.addAttribute("saleOder", new SaleOrder());
		
		model.addAttribute("saleOder", saleOrderService.findAll());
		
		return "administrator/orderList";
	}	
	
	
	@RequestMapping(value = { "/admin/view-order/{orderID}" }, method = RequestMethod.GET)
	public String viewOrder(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("orderID") int orderID 
			) throws IOException {
		
		SaleOrder saleOrder = saleOrderService.getById(orderID);
		model.addAttribute("saleOderID", saleOrder);
		
		Set<SaleOrderProducts> saleIndb = saleOrder.getSaleOrderProducts();
		model.addAttribute("saleOderIndb", saleIndb);

		return "administrator/viewOrder";
	}
	
	@RequestMapping(value = { "/admin/change-sale" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changeSale(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody SaleOrder saleOrder) {
		SaleOrder saleOrderInDb = saleOrderService.getById(saleOrder.getId());
		saleOrderInDb.setStatus(false);
		saleOrderService.saveOrUpdate(saleOrderInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Xác nhận thanh toán thành công!");
		return ResponseEntity.ok(jsonResult);
	}
}
