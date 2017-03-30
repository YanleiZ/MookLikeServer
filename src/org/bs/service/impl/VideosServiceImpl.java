package org.bs.service.impl;

import java.util.List;
import org.bs.dao.VideosDao;
import org.bs.model.Videos;
import org.bs.service.VideosService;

public class VideosServiceImpl implements VideosService {
	VideosDao videosDao;

	public void add(Videos videos) {
		videosDao.save(videos);
	}

	public void delete(Videos videos) {
		videosDao.delete(videos.getId());
	}

	public void update(Videos videos) {
		videosDao.update(videos);
	}

	public Videos findById(int id) {
		return videosDao.getById(id);
	}

	public Videos findByUserId(int id) {
		return videosDao.getByUserId(id);
	}

	public List<Videos> search(String str) {
		return videosDao.query(str);
	}
	
	public List<Videos> searchAll() {
		return videosDao.queryAll();
	}

	public void setVideosDao(VideosDao videosDao) {
		this.videosDao = videosDao;
	}
}