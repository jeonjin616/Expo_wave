package com.multi.wave.md;

public class MDImgVO {

	private int MD_img_id;
	private String MD_img;
	private int MD_id;
	
	
	
	@Override
	public String toString() {
		return "MDImgDTO [MD_img_id=" + MD_img_id + ", MD_img=" + MD_img + ", MD_id=" + MD_id + "]";
	}
	public int getMD_img_id() {
		return MD_img_id;
	}
	public void setMD_img_id(int mD_img_id) {
		MD_img_id = mD_img_id;
	}
	public String getMD_img() {
		return MD_img;
	}
	public void setMD_img(String mD_img) {
		MD_img = mD_img;
	}
	public int getMD_id() {
		return MD_id;
	}
	public void setMD_id(int mD_id) {
		MD_id = mD_id;
	}

	
	
}
