package org.bs.dao;

import java.util.List;
import org.bs.model.DoneTest;

public interface DoneTestDao {
	public void save(DoneTest doneTest);

	public void delete(int id);

	public void update(DoneTest doneTest);

	public DoneTest getById(int id);

	public List<DoneTest> query(String str);

	public DoneTest getByUserId(int id);
}