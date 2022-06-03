package com.devpro.shoppet.service;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shoppet.dto.ProductSearchModel;
import com.devpro.shoppet.entities.Categories;
import com.github.slugify.Slugify;

@Service
public class CategoriesService extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz() {
		return Categories.class;
	}
	
	public PagerData<Categories> search(ProductSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_category p WHERE 1=1";

		if (searchModel != null) {
			
			//tìm theo seo
			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo = '" + searchModel.seo + "'";
			}			
		}

		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	
	
	@Transactional
	public Categories add(Categories c) throws IllegalStateException, IOException {
		
		c.setName(c.getName());
		c.setDescription(c.getDescription());
		
		c.setSeo(new Slugify().slugify(c.getName())+ "-" + System.currentTimeMillis());
		
		return super.saveOrUpdate(c);
	}
	
	@Transactional
	public Categories update(Categories c) throws IllegalStateException, IOException {
		
		Categories categoryInDb = super.getById(c.getId());
		if(categoryInDb.getName().compareToIgnoreCase(c.getName()) != 0) {
			c.setName(c.getName());
		}
		else {
			c.setName(categoryInDb.getName());
		}
				
		c.setDescription(c.getDescription());
		c.setSeo(new Slugify().slugify(c.getName()) + "-" + System.currentTimeMillis());
		
		return super.saveOrUpdate(c);
	}
}
