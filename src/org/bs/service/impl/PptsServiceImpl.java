package org.bs.service.impl;

import java.util.List;
import org.bs.dao.PptsDao;
import org.bs.model.Ppts;
import org.bs.service.PptsService;

public class PptsServiceImpl implements PptsService {
	PptsDao pptsDao;

	public void add(Ppts ppts) {
		pptsDao.save(ppts);
	}

	public void delete(Ppts ppts) {
		pptsDao.delete(ppts.getId());
	}

	public void update(Ppts ppts) {
		pptsDao.update(ppts);
	}

	public Ppts findById(int id) {
		return pptsDao.getById(id);
	}

	public Ppts findByUserId(int id) {
		return pptsDao.getByUserId(id);
	}

	public List<Ppts> search(String str) {
		return pptsDao.query(str);
	}

	public void setPptsDao(PptsDao pptsDao) {
		this.pptsDao = pptsDao;
	}
}