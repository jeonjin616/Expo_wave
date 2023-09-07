package com.multi.wave.md;

public class MDCommentVO {

	private int MD_comment_id;
	private String MD_comment;
	private String MD_comment_create;
	private String MD_comment_modifi;
	private int MD_id;
	private String MD_comment_writer;
	
	
	
	
	@Override
	public String toString() {
		return "MDCommentVO [MD_comment_id=" + MD_comment_id + ", MD_comment=" + MD_comment + ", MD_comment_create="
				+ MD_comment_create + ", MD_comment_modifi=" + MD_comment_modifi + ", MD_id=" + MD_id
				+ ", MD_comment_writer=" + MD_comment_writer + "]";
	}
	
	public String getMD_comment_writer() {
		return MD_comment_writer;
	}
	public void setMD_comment_writer(String mD_comment_writer) {
		MD_comment_writer = mD_comment_writer;
	}
	public int getMD_comment_id() {
		return MD_comment_id;
	}
	public void setMD_comment_id(int mD_comment_id) {
		MD_comment_id = mD_comment_id;
	}
	public String getMD_comment() {
		return MD_comment;
	}
	public void setMD_comment(String mD_comment) {
		MD_comment = mD_comment;
	}
	public String getMD_comment_create() {
		return MD_comment_create;
	}
	public void setMD_comment_create(String mD_comment_create) {
		MD_comment_create = mD_comment_create;
	}
	public String getMD_comment_modifi() {
		return MD_comment_modifi;
	}
	public void setMD_comment_modifi(String mD_comment_modifi) {
		MD_comment_modifi = mD_comment_modifi;
	}
	public int getMD_id() {
		return MD_id;
	}
	public void setMD_id(int mD_id) {
		MD_id = mD_id;
	}

	
}
