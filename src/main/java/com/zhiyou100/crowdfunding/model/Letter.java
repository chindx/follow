package com.zhiyou100.crowdfunding.model;

import java.util.Date;

public class Letter {
	private int id;
	private int userAddresserId;
	private int userRecipientsId;
	private String content;
	private Date createTime;

	public Letter() {
		super();

	}

	public Letter(int id, int userAddresserId, int userRecipientsId, String content, Date createTime) {
		super();
		this.id = id;
		this.userAddresserId = userAddresserId;
		this.userRecipientsId = userRecipientsId;
		this.content = content;
		this.createTime = createTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserAddresserId() {
		return userAddresserId;
	}

	public void setUserAddresserId(int userAddresserId) {
		this.userAddresserId = userAddresserId;
	}

	public int getUserRecipientsId() {
		return userRecipientsId;
	}

	public void setUserRecipientsId(int userRecipientsId) {
		this.userRecipientsId = userRecipientsId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Letter [id=" + id + ", userAddresserId=" + userAddresserId + ", userRecipientsId=" + userRecipientsId
				+ ", content=" + content + ", createTime=" + createTime + "]";
	}

}
