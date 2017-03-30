package org.bs.service;

import java.util.List;
import org.bs.model.News;

public interface NewsService {
	public void add(News news);

	public void delete(News news);

	public void update(News news);

	public News findById(int id);

	public News findByUserId(int id);

	public List<News> search(String str);
}