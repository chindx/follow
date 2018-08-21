package com.zhiyou100.crowdfunding.model;

import java.util.Date;

public class QuestionOther {
	//
	private int id;
	  
	private int questionId;
	  
	private String name;
	  
	private String answer;
	  
	private Date date;

	public QuestionOther() {
		super();
		
	}

	public QuestionOther(int id, int questionId, String name, String answer, Date date) {
		super();
		this.id = id;
		this.questionId = questionId;
		this.name = name;
		this.answer = answer;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuestionid() {
		return questionId;
	}

	public void setQuestionid(int questionId) {
		this.questionId = questionId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "QuestionOther [id=" + id + ", questionId=" + questionId + ", name=" + name + ", answer="
				+ answer + ", date=" + date + "]";
	}
}
