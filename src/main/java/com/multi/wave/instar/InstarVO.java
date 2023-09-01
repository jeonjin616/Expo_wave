package com.multi.wave.instar;

public class InstarVO {

	private String id;
	private String media_type;
	private String media_url;
	private String permalink;
	private String username;
	private String caption;
	
	public String getId() {
		return id;
	}
	public void setId(String string) {
		this.id = string;
	}
	public String getMedia_type() {
		return media_type;
	}
	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}
	public String getMedia_url() {
		return media_url;
	}
	public void setMedia_url(String media_url) {
		this.media_url = media_url;
	}
	public String getPermalink() {
		return permalink;
	}
	public void setPermalink(String permalink) {
		this.permalink = permalink;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	
	@Override
	public String toString() {
		return "InstarVO [id=" + id + ", media_type=" + media_type + ", media_url=" + media_url + ", permalink="
				+ permalink + ", username=" + username + ", caption=" + caption + "]";
	}

	

}
