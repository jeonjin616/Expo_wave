package com.multi.wave.notice;

public class BoardVO {
	private int board_id;
	private String board_title;
	private String board_create_date;
	private String board_content;
	private String img;



	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_create_date() {
		return board_create_date;
	}

	public void setBoard_create_date(String board_create_date) {
		this.board_create_date = board_create_date;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

}