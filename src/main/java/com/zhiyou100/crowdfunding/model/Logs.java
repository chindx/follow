package com.zhiyou100.crowdfunding.model;

public class Logs {
	private int id;
	private int userId;
	private String content;

	public Logs() {
		super();

	}

	public Logs(int id, int userId, String content) {
		super();
		this.id = id;
		this.userId = userId;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Logs [id=" + id + ", userId=" + userId + ", content=" + content + "]";
	}

}
