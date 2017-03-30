package org.bs.dao;

import java.util.List;
import org.bs.model.Course;

public interface CourseDao {
	public void save(Course course);

	public void delete(int id);

	public void update(Course course);

	public Course getById(int id);

	public List<Course> query(String str);

	public Course getByUserId(int id);
}