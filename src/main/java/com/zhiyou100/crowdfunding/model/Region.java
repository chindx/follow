package com.zhiyou100.crowdfunding.model;

public class Region {
	
	private int id;
	
	private int parentId;
	
	private String name;
	
	private int code;

	public Region() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "Region [id=" + id + ", parentId=" + parentId + ", name=" + name + ", code=" + code + "]";
	}
}
