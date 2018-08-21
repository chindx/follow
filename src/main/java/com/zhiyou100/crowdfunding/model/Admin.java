package com.zhiyou100.crowdfunding.model;

public class Admin {
	private int id;
	private String name;
	private String password;
	private char gender;
	private String accountName;

	public Admin() {
		super();
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public Admin(int id, String name, String password, char gender, String accountName) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.accountName = accountName;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", password=" + password + ", gender=" + gender + ", accountName="
				+ accountName + "]";
	}

}
