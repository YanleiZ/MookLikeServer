package org.bs.service;

import java.util.List;
import org.bs.model.Admins;

public interface AdminsService {
	public void add(Admins admins);

	public void delete(Admins admins);

	public void update(Admins admins);

	public Admins findById(int id);

	public Admins findByUserId(int id);

	public List<Admins> search(String str);
}