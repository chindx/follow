package com.zhiyou100.crowdfunding.model;

import java.text.ParseException;
import java.util.Date;

import com.zhiyou100.crowdfunding.utils.DateUtils;

public class Projects {
	private int id;
	private int userId;
	private String custName;
	private String custPhone;
	private String custAddress;
	private int pstId;
	private String file;
	private String name;
	private String goal;
	private String address;
	private double money;
	private int days;
	private String video;
	private String story;
	private String support;
	private String repay;
	private String aboutMe;
	private int type;
	private Date startTime;
	private Date endTime;
	private double raisedMoney;
	private int supporter;
	private int auditor;
	
	private User user;
	private Admin admin;
	private ProjectsType psType;
	
	public Projects() {
		super();
	}

	public Projects(int id, int userId, String custName, String custPhone, String custAddress, int pstId, String file,
			String name, String goal, String address, double money, int days, String video, String story,
			String support, String repay, String aboutMe, int type, Date startTime, Date endTime, double raisedMoney,
			int supporter, int auditor) {
		super();
		this.id = id;
		this.userId = userId;
		this.custName = custName;
		this.custPhone = custPhone;
		this.custAddress = custAddress;
		this.pstId = pstId;
		this.file = file;
		this.name = name;
		this.goal = goal;
		this.address = address;
		this.money = money;
		this.days = days;
		this.video = video;
		this.story = story;
		this.support = support;
		this.repay = repay;
		this.aboutMe = aboutMe;
		this.type = type;
		this.startTime = startTime;
		this.endTime = endTime;
		this.raisedMoney = raisedMoney;
		this.supporter = supporter;
		this.auditor = auditor;		
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

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustPhone() {
		return custPhone;
	}

	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
	}

	public String getCustAddress() {
		return custAddress;
	}

	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}

	public int getPstId() {
		return pstId;
	}

	public void setPstId(int pstId) {
		this.pstId = pstId;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getSupport() {
		return support;
	}

	public void setSupport(String support) {
		this.support = support;
	}

	public String getRepay() {
		return repay;
	}

	public void setRepay(String repay) {
		this.repay = repay;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getStartTime() {		
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {		
		return endTime;
	}

	public void setEndTime(Date endTime) {		
		this.endTime = endTime;
	}

	public double getRaisedMoney() {
		return raisedMoney;
	}

	public void setRaisedMoney(double raisedMoney) {
		this.raisedMoney = raisedMoney;
	}

	public int getSupporter() {
		return supporter;
	}

	public void setSupporter(int supporter) {
		this.supporter = supporter;
	}

	public int getAuditor() {
		return auditor;
	}

	public void setAuditor(int auditor) {
		this.auditor = auditor;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public ProjectsType getPsType() {
		return psType;
	}

	public void setPsType(ProjectsType psType) {
		this.psType = psType;
	}

	@Override
	public String toString() {
		return "Protects [id=" + id + ", userId=" + userId + ", custName=" + custName + ", custPhone=" + custPhone
				+ ", custAddress=" + custAddress + ", pstId=" + pstId + ", file=" + file + ", name=" + name + ", goal="
				+ goal + ", address=" + address + ", money=" + money + ", days=" + days + ", video=" + video
				+ ", story=" + story + ", support=" + support + ", repay=" + repay + ", aboutMe=" + aboutMe + ", type="
				+ type + ", startTime=" + startTime + ", endTime=" + endTime + ", raisedMoney=" + raisedMoney + ", supporter="
				+ supporter + ", auditor=" + auditor + "]";
	}
}
