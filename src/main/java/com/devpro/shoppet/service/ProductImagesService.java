package com.devpro.shoppet.service;

import org.springframework.stereotype.Service;

import com.devpro.shoppet.entities.ProductImages;

@Service
public class ProductImagesService extends BaseService<ProductImages> {

	@Override
	protected Class<ProductImages> clazz() {
		return ProductImages.class;
	}
	
}
