package com.zhiyou100.crowdfunding.model;

public class QuestionAll {
	private int id;
	  
	private String questionName;

	public QuestionAll() {
		super();
		
	}

	public QuestionAll(int id, String questionName) {
		super();
		this.id = id;
		this.questionName = questionName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestionName() {
		return questionName;
	}

	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}

	@Override
	public String toString() {
		return "QuestionAll [id=" + id + ", questionName=" + questionName + "]";
	}

}
