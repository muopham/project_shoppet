package com.devpro.shoppet.dto;

public class AdminContact {
	
	private String title;
	private String price;
	private String description;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public AdminContact() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminContact(String title, String price, String description) {
		super();
		this.title = title;
		this.price = price;
		this.description = description;
	}
	
	
}
