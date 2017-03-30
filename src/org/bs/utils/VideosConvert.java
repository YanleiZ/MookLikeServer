package org.bs.utils;

import org.apache.commons.beanutils.Converter;
import org.bs.model.Videos;

public class VideosConvert implements Converter {
	public Object convert(Class targetClass, Object value) {
		Videos videos = null;
		if (targetClass == Videos.class) {
			videos = new Videos();
			videos.setId(Integer.parseInt((String) value));
		}
		return videos;
	}
}