package org.bs.model;

public class Course {
	private int id;
	private String name;
	private String descp;
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

	public String getDescp() {
		return descp;
	}

	public void setDescp(String descp) {
		this.descp = descp;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String toString() {
		return "Course [id=" + id + ", name=" + name + ", descp=" + descp
				+ ", img=" + img + "]";
	}
}