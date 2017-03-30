package org.bs.dao;

import java.util.List;
import org.bs.model.Ppts;

public interface PptsDao {
	public void save(Ppts ppts);

	public void delete(int id);

	public void update(Ppts ppts);

	public Ppts getById(int id);

	public List<Ppts> query(String str);

	public Ppts getByUserId(int id);
}