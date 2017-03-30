package org.bs.utils;

import org.apache.commons.beanutils.Converter;
import org.bs.model.Tests;

public class TestsConvert implements Converter {
	public Object convert(Class targetClass, Object value) {
		Tests tests = null;
		if (targetClass == Tests.class) {
			tests = new Tests();
			tests.setId(Integer.parseInt((String) value));
		}
		return tests;
	}
}