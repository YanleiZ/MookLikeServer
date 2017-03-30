package org.bs.utils;

import org.apache.commons.beanutils.Converter;
import org.bs.model.Words;

public class WordsConvert implements Converter {
	public Object convert(Class targetClass, Object value) {
		Words words = null;
		if (targetClass == Words.class) {
			words = new Words();
			words.setId(Integer.parseInt((String) value));
		}
		return words;
	}
}