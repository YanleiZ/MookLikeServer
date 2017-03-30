package org.bs.dao;

import java.util.List;
import org.bs.model.Tests;

public interface TestsDao {
	public void save(Tests tests);

	public void delete(int id);

	public void update(Tests tests);

	public Tests getById(int id);

	public List<Tests> query(String str);

	public Tests getByUserId(int id);
}