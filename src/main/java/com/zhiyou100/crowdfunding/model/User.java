package com.zhiyou100.crowdfunding.model;

import java.util.Date;

public class User {
	private int id;
	private String email;
	private String name;
	private String password;
	private double money;
	private String idcard;
	private String phone;
	private String address;
	private int role;
	private char sex;
	private String code;
	private Date createTime;
	private Date updateTime;
	private String realName;
	public User() {
		super();		
	}
	public User(int id, String email, String name, String password, double money, String idcard, String phone,
			String address, int role, char sex, String code, Date createTime, Date updateTime) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.password = password;
		this.money = money;
		this.idcard = idcard;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.sex = sex;
		this.code = code;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", name=" + name + ", password=" + password + ", money=" + money
				+ ", idcard=" + idcard + ", phone=" + phone + ", address=" + address + ", role=" + role + ", sex=" + sex
				+ ", code=" + code + ", createTime=" + createTime + ", updateTime=" + updateTime + ", realName=" + realName + "]";
	}

}
