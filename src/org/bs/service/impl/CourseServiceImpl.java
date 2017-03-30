package org.bs.service.impl;

import java.util.List;
import org.bs.dao.CourseDao;
import org.bs.model.Course;
import org.bs.service.CourseService;

public class CourseServiceImpl implements CourseService {
	CourseDao courseDao;

	public void add(Course course) {
		courseDao.save(course);
	}

	public void delete(Course course) {
		courseDao.delete(course.getId());
	}

	public void update(Course course) {
		courseDao.update(course);
	}

	public Course findById(int id) {
		return courseDao.getById(id);
	}

	public Course findByUserId(int id) {
		return courseDao.getByUserId(id);
	}

	public List<Course> search(String str) {
		return courseDao.query(str);
	}

	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}
}