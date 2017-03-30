package org.bs.service.impl;

import java.util.List;
import org.bs.dao.DoneTestDao;
import org.bs.model.DoneTest;
import org.bs.service.DoneTestService;

public class DoneTestServiceImpl implements DoneTestService {
	DoneTestDao doneTestDao;

	public void add(DoneTest doneTest) {
		doneTestDao.save(doneTest);
	}

	public void delete(DoneTest doneTest) {
		doneTestDao.delete(doneTest.getId());
	}

	public void update(DoneTest doneTest) {
		doneTestDao.update(doneTest);
	}

	public DoneTest findById(int id) {
		return doneTestDao.getById(id);
	}

	public DoneTest findByUserId(int id) {
		return doneTestDao.getByUserId(id);
	}

	public List<DoneTest> search(String str) {
		return doneTestDao.query(str);
	}

	public void setDoneTestDao(DoneTestDao doneTestDao) {
		this.doneTestDao = doneTestDao;
	}
}