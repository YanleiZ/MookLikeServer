package org.bs.model;

public class Index {
	private int id;
	private Course course;
	private Ppts ppts;
	private Videos videos;
	private Words words;
	private Tests tests;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Ppts getPpts() {
		return ppts;
	}

	public void setPpts(Ppts ppts) {
		this.ppts = ppts;
	}

	public Videos getVideos() {
		return videos;
	}

	public void setVideos(Videos videos) {
		this.videos = videos;
	}

	public Words getWords() {
		return words;
	}

	public void setWords(Words words) {
		this.words = words;
	}

	public Tests getTests() {
		return tests;
	}

	public void setTests(Tests tests) {
		this.tests = tests;
	}

	public String toString() {
		return "Index [id=" + id + ", course=" + course + ", ppts=" + ppts
				+ ", videos=" + videos + ", words=" + words + ", tests="
				+ tests + "]";
	}
}