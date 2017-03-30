package org.bs.dao;

import java.util.List;
import org.bs.model.Admins;

public interface AdminsDao {
	public void save(Admins admins);

	public void delete(int id);

	public void update(Admins admins);

	public Admins getById(int id);

	public List<Admins> query(String str);

	public Admins getByUserId(int id);
}