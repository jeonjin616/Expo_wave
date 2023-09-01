package com.multi.wave.md;

public class MDPostVO {

	private int MD_id;
	private String MD_title;
	private String MD_content;
	private String MD_create;
	private String MD_modifi;
	private String MD_post_Thumbnail;
	
	public int getMD_id() {
		return MD_id;
	}

	public void setMD_id(int mD_id) {
		MD_id = mD_id;
	}

	public String getMD_title() {
		return MD_title;
	}

	public void setMD_title(String mD_title) {
		MD_title = mD_title;
	}

	public String getMD_content() {
		return MD_content;
	}

	public void setMD_content(String mD_content) {
		MD_content = mD_content;
	}

	public String getMD_create() {
		return MD_create;
	}

	public void setMD_create(String mD_create) {
		MD_create = mD_create;
	}

	public String getMD_modifi() {
		return MD_modifi;
	}

	public void setMD_modifi(String mD_modifi) {
		MD_modifi = mD_modifi;
	}

	public String getMD_post_Thumbnail() {
		return MD_post_Thumbnail;
	}

	public void setMD_post_Thumbnail(String mD_post_Thumbnail) {
		MD_post_Thumbnail = mD_post_Thumbnail;
	}

	@Override
	public String toString() {
		return "MDPostDTO [MD_id=" + MD_id + ", MD_title=" + MD_title + ", MD_content=" + MD_content + ", MD_create="
				+ MD_create + ", MD_modifi=" + MD_modifi + ", MD_post_Thumbnail=" + MD_post_Thumbnail + "]";
	}


	

}
