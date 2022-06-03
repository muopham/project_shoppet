package com.devpro.shoppet.service;

import org.springframework.stereotype.Service;

import com.devpro.shoppet.entities.SaleOrderProducts;

@Service
public class SaleOrderProductsService extends BaseService<SaleOrderProducts>{

	@Override
	protected Class<SaleOrderProducts> clazz() {
		
		return SaleOrderProducts.class;
	}

}
