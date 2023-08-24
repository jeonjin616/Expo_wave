package com.multi.wave.member;

public class MemberVO {
	private int mem_num;
	private String mem_id;
	private String mem_name;
	private String mem_pw;
	private String mem_nickname;

	private String memEmail;
	private String domainList;
	private String mem_email; // 10 + 11 을 12에 넣어주기(컨트롤러에서)
	private String mem_birth;
	private String mem_zipcode;

	private String mem_addr1;
	private String mem_addr2;
	private String mem_phone1;
	private String mem_phone2;
	private String mem_phone3;
	private String mem_joy1;
	private String mem_joy2;
	private String mem_img;

	public void setDomainList(String domainList) {
		this.domainList = domainList;
	}

	public String getDomainList() {
		return domainList;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_addr1() {
		return mem_addr1;
	}

	public void setMem_addr1(String mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}

	public String getMem_addr2() {
		return mem_addr2;
	}

	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}

	public String getMem_phone1() {
		return mem_phone1;
	}

	public void setMem_phone1(String mem_phone1) {
		this.mem_phone1 = mem_phone1;
	}

	public String getMem_phone2() {
		return mem_phone2;
	}

	public void setMem_phone2(String mem_phone2) {
		this.mem_phone2 = mem_phone2;
	}

	public String getMem_phone3() {
		return mem_phone3;
	}

	public void setMem_phone3(String mem_phone3) {
		this.mem_phone3 = mem_phone3;
	}

	public String getMem_joy1() {
		return mem_joy1;
	}

	public void setMem_joy1(String mem_joy1) {
		this.mem_joy1 = mem_joy1;
	}

	public String getMem_joy2() {
		return mem_joy2;
	}

	public void setMem_joy2(String mem_joy2) {
		this.mem_joy2 = mem_joy2;
	}

	public String getMem_img() {
		return mem_img;
	}

	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}

	@Override
	public String toString() {
		return "MemberVO [mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_name=" + mem_name + ", mem_pw=" + mem_pw
				+ ", mem_nickname=" + mem_nickname + ", memEmail=" + memEmail + ", domainList=" + domainList
				+ ", mem_email=" + mem_email + ", mem_birth=" + mem_birth + ", mem_zipcode=" + mem_zipcode
				+ ", mem_addr1=" + mem_addr1 + ", mem_addr2=" + mem_addr2 + ", mem_phone1=" + mem_phone1
				+ ", mem_phone2=" + mem_phone2 + ", mem_phone3=" + mem_phone3 + ", mem_joy1=" + mem_joy1 + ", mem_joy2="
				+ mem_joy2 + ", mem_img=" + mem_img + ", getDomainList()=" + getDomainList() + ", getMemEmail()="
				+ getMemEmail() + ", getMem_num()=" + getMem_num() + ", getMem_id()=" + getMem_id() + ", getMem_name()="
				+ getMem_name() + ", getMem_pw()=" + getMem_pw() + ", getMem_nickname()=" + getMem_nickname()
				+ ", getMem_email()=" + getMem_email() + ", getMem_birth()=" + getMem_birth() + ", getMem_zipcode()="
				+ getMem_zipcode() + ", getMem_addr1()=" + getMem_addr1() + ", getMem_addr2()=" + getMem_addr2()
				+ ", getMem_phone1()=" + getMem_phone1() + ", getMem_phone2()=" + getMem_phone2() + ", getMem_phone3()="
				+ getMem_phone3() + ", getMem_joy1()=" + getMem_joy1() + ", getMem_joy2()=" + getMem_joy2()
				+ ", getMem_img()=" + getMem_img() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
