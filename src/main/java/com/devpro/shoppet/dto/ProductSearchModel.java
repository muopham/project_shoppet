package com.devpro.shoppet.dto;

public class ProductSearchModel extends BaseSearchModel{
	// tìm theo keyword
	public String keyword;
	
	// tìm theo category
	public Integer categoryId;

	public String seo;

	public String isHot;

	public String sortField;
	
	public String sortDir;
	
	public Integer sortPrice;
		
	public Integer getSortPrice() {
		return sortPrice;
	}

	public void setSortPrice(Integer sortPrice) {
		this.sortPrice = sortPrice;
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getSortDir() {
		return sortDir;
	}

	public void setSortDir(String sortDir) {
		this.sortDir = sortDir;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public String getIsHot() {
		return isHot;
	}

	public void setIsHot(String isHot) {
		this.isHot = isHot;
	}

	

}
