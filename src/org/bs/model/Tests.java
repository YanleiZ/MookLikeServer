package org.bs.model;

import java.util.Date;

public class Tests {
	private int id;
	private String name;
	private Date settime;
	private Course course;
	private String descp;
	private String timucontent;
	private String daancontent;

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

	public String getTimucontent() {
		return timucontent;
	}

	public void setTimucontent(String timucontent) {
		this.timucontent = timucontent;
	}

	public String getDaancontent() {
		return daancontent;
	}

	public void setDaancontent(String daancontent) {
		this.daancontent = daancontent;
	}

	public String toString() {
		return "Tests [id=" + id + ", name=" + name + ", settime=" + settime
				+ ", course=" + course + ", descp=" + descp + ", timucontent="
				+ timucontent + ", daancontent=" + daancontent + "]";
	}
}