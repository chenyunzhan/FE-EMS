package com.ems.fe.basedata.model;

/**
 * 管理员类
 * @author 陈云展
 *
 */
public class Admin {
	private String aId;
	private String aPassword;
	private String aName;
	private int aAge;
	private String aPhone;
	private String aEmail;
	private String aSex;
	public String getASex() {
		return aSex;
	}
	public void setASex(String sex) {
		aSex = sex;
	}
	public String getAId() {
		return aId;
	}
	public void setAId(String id) {
		aId = id;
	}
	public String getAPassword() {
		return aPassword;
	}
	public void setAPassword(String password) {
		aPassword = password;
	}
	public String getAName() {
		return aName;
	}
	public void setAName(String name) {
		aName = name;
	}
	public int getAAge() {
		return aAge;
	}
	public void setAAge(int age) {
		aAge = age;
	}
	public String getAPhone() {
		return aPhone;
	}
	public void setAPhone(String phone) {
		aPhone = phone;
	}
	public String getAEmail() {
		return aEmail;
	}
	public void setAEmail(String email) {
		aEmail = email;
	}
	
}
