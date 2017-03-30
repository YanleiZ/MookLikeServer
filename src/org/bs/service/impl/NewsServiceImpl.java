package org.bs.service.impl;

import java.util.List;
import org.bs.dao.NewsDao;
import org.bs.model.News;
import org.bs.service.NewsService;

public class NewsServiceImpl implements NewsService {
	NewsDao newsDao;

	public void add(News news) {
		newsDao.save(news);
	}

	public void delete(News news) {
		newsDao.delete(news.getId());
	}

	public void update(News news) {
		newsDao.update(news);
	}

	public News findById(int id) {
		return newsDao.getById(id);
	}

	public News findByUserId(int id) {
		return newsDao.getByUserId(id);
	}

	public List<News> search(String str) {
		return newsDao.query(str);
	}

	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}
}