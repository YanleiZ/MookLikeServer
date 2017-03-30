package org.bs.model;

import java.util.Date;

public class Words {
	private int id;
	private String name;
	private Date settime;
	private Course course;
	private String descp;
	private String docts;
	private String content;
	private String img;

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

	public Date getSettime() {
		return settime;
	}

	public void setSettime(Date settime) {
		this.settime = settime;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getDescp() {
		return descp;
	}

	public void setDescp(String descp) {
		this.descp = descp;
	}

	public String getDocts() {
		return docts;
	}

	public void setDocts(String docts) {
		this.docts = docts;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String toString() {
		return "Words [id=" + id + ", name=" + name + ", settime=" + settime
				+ ", course=" + course + ", descp=" + descp + ", docts="
				+ docts + ", content=" + content + ", img=" + img + "]";
	}
}