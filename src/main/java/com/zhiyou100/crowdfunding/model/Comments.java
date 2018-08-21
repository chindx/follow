package com.zhiyou100.crowdfunding.model;

import java.util.Date;

public class Comments {
	private int id;
	private int userId;
	private int psId;
	private String content;
	private Date time;
	
	private User user;
	private Projects projects;

	public Comments() {
		super();

	}

	public Comments(int id, int userId, int psId, String content, Date time) {
		super();
		this.id = id;
		this.userId = userId;
		this.psId = psId;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
		return "Comments [id=" + id + ", userId=" + userId + ", psId=" + psId + ", content=" + content + ", time="
				+ time + ", user=" + user + ", projects=" + projects + "]";
	}
	
}
