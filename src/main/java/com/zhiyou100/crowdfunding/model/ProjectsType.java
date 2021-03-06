package com.zhiyou100.crowdfunding.model;

import java.util.Date;

public class ProjectsType {
	private int id;

	private String name;

	private String desc;

	private Date startDate;

	private int type;

	public ProjectsType() {
		super();
	}

	public ProjectsType(int id, String name, String desc, Date startDate, int type) {
		super();
		this.id = id;
		this.name = name;
		this.desc = desc;
		this.startDate = startDate;
		this.type = type;
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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ProjectsType [id=" + id + ", name=" + name + ", desc=" + desc + ", startDate=" + startDate + ", type="
				+ type + "]";
	}

}
