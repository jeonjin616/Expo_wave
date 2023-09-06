package com.multi.wave.review;

public class ReviewVO {
	
	private int review_id;
	private String mem_id;
	private int fsv_id;
	private String event_name;
	private String show_id;
	private String review_title;
	private String review_content;
	private String review_image;
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getFsv_id() {
		return fsv_id;
	}
	public void setFsv_id(int fsv_id) {
		this.fsv_id = fsv_id;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getShow_id() {
		return show_id;
	}
	public void setShow_id(String show_id) {
		this.show_id = show_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", mem_id=" + mem_id + ", fsv_id=" + fsv_id + ", event_name="
				+ event_name + ", show_id=" + show_id + ", review_title=" + review_title + ", review_content="
				+ review_content + ", review_image=" + review_image + "]";
	}

}
