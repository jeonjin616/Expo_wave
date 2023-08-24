package com.multi.wave.notice;

import org.bson.Document;

public class ChatVO {
	private int id;
	private String user_message;
	private String chat_message;
	private String name;
	private String theme;

	
	public ChatVO(Document document) {
		this.id = document.getInteger("id");
		this.user_message = document.getString("user_message");
		this.chat_message = document.getString("chat_message");
		this.name = document.getString("name");
		this.theme = document.getString("theme");

	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_message() {
		return user_message;
	}

	public void setUser_message(String user_message) {
		this.user_message = user_message;
	}

	public String getChat_message() {
		return chat_message;
	}

	public void setChat_message(String chat_message) {
		this.chat_message = chat_message;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

}