package org.bs.dao;

import java.util.List;
import org.bs.model.News;

public interface NewsDao {
	public void save(News news);

	public void delete(int id);

	public void update(News news);

	public News getById(int id);

	public List<News> query(String str);

	public News getByUserId(int id);
}