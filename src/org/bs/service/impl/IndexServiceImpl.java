package org.bs.service.impl;

import java.util.List;
import org.bs.dao.IndexDao;
import org.bs.model.Index;
import org.bs.service.IndexService;

public class IndexServiceImpl implements IndexService {
	IndexDao indexDao;

	public void add(Index index) {
		indexDao.save(index);
	}

	public void delete(Index index) {
		indexDao.delete(index.getId());
	}

	public void update(Index index) {
		indexDao.update(index);
	}

	public Index findById(int id) {
		return indexDao.getById(id);
	}

	public Index findByUserId(int id) {
		return indexDao.getByUserId(id);
	}

	public List<Index> search(String str) {
		return indexDao.query(str);
	}

	public void setIndexDao(IndexDao indexDao) {
		this.indexDao = indexDao;
	}
}