package com.devpro.shoppet.service;

import java.util.List;

import com.devpro.shoppet.entities.BaseEntity;

public class PagerData<E extends BaseEntity> {

	private List<E> data;

	private int totalItems;

	private int currentPage;

	public List<E> getData() {
		return data;
	}

	public void setData(List<E> data) {
		this.data = data;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}
