package com.devpro.shoppet.service;

import org.springframework.stereotype.Service;

import com.devpro.shoppet.entities.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	
	public SaleOrder loadSale(int id) {
		String sql = "select * from tbl_saleorder u where u.user_id = '" + id + "'";
		return this.getOneByNativeSQL(sql);
	}
	
}
