package org.bs.utils;

import org.apache.commons.beanutils.Converter;
import org.bs.model.Course;

public class CourseConvert implements Converter {
	public Object convert(Class targetClass, Object value) {
		Course course = null;
		if (targetClass == Course.class) {
			course = new Course();
			course.setId(Integer.parseInt((String) value));
		}
		return course;
	}
}