package org.bs.service;

import java.util.List;
import org.bs.model.Course;

public interface CourseService {
	public void add(Course course);

	public void delete(Course course);

	public void update(Course course);

	public Course findById(int id);

	public Course findByUserId(int id);

	public List<Course> search(String str);
}