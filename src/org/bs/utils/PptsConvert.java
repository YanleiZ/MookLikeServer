package org.bs.utils;

import org.apache.commons.beanutils.Converter;
import org.bs.model.Ppts;

public class PptsConvert implements Converter {
	public Object convert(Class targetClass, Object value) {
		Ppts ppts = null;
		if (targetClass == Ppts.class) {
			ppts = new Ppts();
			ppts.setId(Integer.parseInt((String) value));
		}
		return ppts;
	}
}