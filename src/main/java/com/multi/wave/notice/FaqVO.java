package com.multi.wave.notice;

import java.util.Date;

public class FaqVO {
	private int faq_id;
	private String faq_title;
	private String faq_content;
	private String faq_create_date;
	private String img;
	
	
	
	
	
	
	
	public int getFaq_id() {
		return faq_id;
	}
	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_create_date() {
		return faq_create_date;
	}
	public void setFaq_create_date(String faq_create_date) {
		this.faq_create_date = faq_create_date;
	}
	
	
	


	
}