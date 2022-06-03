package com.devpro.shoppet.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_blog")
public class Blog extends BaseEntity{
	
	@Column(name = "title", length = 1000, nullable = false)
	private String title;
	@Column(name = "short_description", length = 3000, nullable = false)
	private String shortDes;
	
	@Lob
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String details;
	
	@Column(name = "avatar", nullable = false)
	private String avatar;
	
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShortDes() {
		return shortDes;
	}

	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}
	
	
	
}
