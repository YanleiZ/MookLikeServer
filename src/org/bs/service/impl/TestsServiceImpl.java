package org.bs.service.impl;

import java.util.List;
import org.bs.dao.TestsDao;
import org.bs.model.Tests;
import org.bs.service.TestsService;

public class TestsServiceImpl implements TestsService {
	TestsDao testsDao;

	public void add(Tests tests) {
		testsDao.save(tests);
	}

	public void delete(Tests tests) {
		testsDao.delete(tests.getId());
	}

	public void update(Tests tests) {
		testsDao.update(tests);
	}

	public Tests findById(int id) {
		return testsDao.getById(id);
	}

	public Tests findByUserId(int id) {
		return testsDao.getByUserId(id);
	}

	public List<Tests> search(String str) {
		return testsDao.query(str);
	}

	public void setTestsDao(TestsDao testsDao) {
		this.testsDao = testsDao;
	}
}