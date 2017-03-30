package org.bs.model;

import java.util.Date;

public class DoneTest {
	private int id;
	private Member member;
	private Tests tests;
	private Date settime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Tests getTests() {
		return tests;
	}

	public void setTests(Tests tests) {
		this.tests = tests;
	}

	public Date getSettime() {
		return settime;
	}

	public void setSettime(Date settime) {
		this.settime = settime;
	}

	public String toString() {
		return "DoneTest [id=" + id + ", member=" + member + ", tests=" + tests
				+ ", settime=" + settime + "]";
	}
}