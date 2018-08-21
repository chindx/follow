package com.zhiyou100.crowdfunding.model;

public class Repay {
	private int id;
	private int userId;
	private int type;
	private double payMoney;
	private String rule;
	private String content;
	private int number;
	private int time;
	private int psId;
	private String code;
	private String picUrl;

	public Repay() {
		super();

	}

	public Repay(int id, int userId, int type, double payMoney, String rule, String content, int number, int time,
			int psId, String code, String picUrl) {
		super();
		this.id = id;
		this.userId = userId;
		this.type = type;
		this.payMoney = payMoney;
		this.rule = rule;
		this.content = content;
		this.number = number;
		this.time = time;
		this.psId = psId;
		this.code = code;
		this.picUrl = picUrl;
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public double getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(double payMoney) {
		this.payMoney = payMoney;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getPsId() {
		return psId;
	}

	public void setPsId(int psId) {
		this.psId = psId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	@Override
	public String toString() {
		return "Repay [id=" + id + ", userId=" + userId + ", type=" + type + ", payMoney=" + payMoney + ", rule=" + rule
				+ ", content=" + content + ", number=" + number + ", time=" + time + ", psId=" + psId
				+ ", code=" + code + ", picUrl=" + picUrl + "]";
	}

}
