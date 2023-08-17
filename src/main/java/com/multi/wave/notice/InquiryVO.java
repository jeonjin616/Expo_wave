package com.multi.wave.notice;

import java.util.Date;

public class InquiryVO {
	private int inqu_id;
    private String inqu_Id; 
    private String inqu_title;
    private String inqu_content;
    private String img; 
    private Date inqu_create_date;
	
    
    
    
	public int getInqu_id() {
		return inqu_id;
	}
	public void setInqu_id(int inqu_id) {
		this.inqu_id = inqu_id;
	}
	public String getInqu_Id() {
		return inqu_Id;
	}
	public void setInqu_Id(String inqu_Id) {
		this.inqu_Id = inqu_Id;
	}
	public String getInqu_title() {
		return inqu_title;
	}
	public void setInqu_title(String inqu_title) {
		this.inqu_title = inqu_title;
	}
	public String getInqu_content() {
		return inqu_content;
	}
	public void setInqu_content(String inqu_content) {
		this.inqu_content = inqu_content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getInqu_create_date() {
		return inqu_create_date;
	}
	public void setInqu_create_date(Date inqu_create_date) {
		this.inqu_create_date = inqu_create_date;
	} 
	
    
    
    
}
