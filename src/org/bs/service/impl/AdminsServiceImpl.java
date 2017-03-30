package org.bs.service.impl;

import java.util.List;
import org.bs.dao.AdminsDao;
import org.bs.model.Admins;
import org.bs.service.AdminsService;

public class AdminsServiceImpl implements AdminsService {
	AdminsDao adminsDao;

	public void add(Admins admins) {
		adminsDao.save(admins);
	}

	public void delete(Admins admins) {
		adminsDao.delete(admins.getId());
	}

	public void update(Admins admins) {
		adminsDao.update(admins);
	}

	public Admins findById(int id) {
		return adminsDao.getById(id);
	}

	public Admins findByUserId(int id) {
		return adminsDao.getByUserId(id);
	}

	public List<Admins> search(String str) {
		return adminsDao.query(str);
	}

	public void setAdminsDao(AdminsDao adminsDao) {
		this.adminsDao = adminsDao;
	}
}