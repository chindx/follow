package com.zhiyou100.crowdfunding.model;

import java.util.Date;

public class Funding {
	private int id;	
	  
	private int userId;
	  
	private int psId;
	  
	private double money;
	  
	private Date time;
	
	private User user;
	
	private Projects projects;

	public Funding() {
		super();		
	}

	public Funding(int id, int userId, int psId, double money, Date time) {
		super();
		this.id = id;
		this.userId = userId;
		this.psId = psId;
		this.money = money;
		this.time = time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPsId() {
		return psId;
	}

	public void setPsId(int psId) {
		this.psId = psId;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Projects getProjects() {
		return projects;
	}

	public void setProjects(Projects projects) {
		this.projects = projects;
	}

	@Override
	public String toString() {
		return "Funding [id=" + id + ", userId=" + userId + ", psId=" + psId + ", money=" + money + ", time=" + time
				+ ", user=" + user + ", projects=" + projects + "]";
	}	

}
