package com.vo;

public class UserVO {
	private String id;
	private String pwd;
	private String name;
	private String admin_yn;

	public UserVO() {
	}

	public UserVO(String id, String pwd, String name) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
	}

	public UserVO(String id, String pwd, String name, String admin_yn) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.admin_yn = admin_yn;
	}

	public String getid() {
		return id;
	}

	public void setid(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getadmin_yn() {
		return admin_yn;
	}

	public void setadmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", admin_yn=" + admin_yn + "]";
	}



}
