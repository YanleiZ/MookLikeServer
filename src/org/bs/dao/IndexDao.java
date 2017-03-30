package org.bs.dao;

import java.util.List;
import org.bs.model.Index;

public interface IndexDao {
	public void save(Index index);

	public void delete(int id);

	public void update(Index index);

	public Index getById(int id);

	public List<Index> query(String str);

	public Index getByUserId(int id);
}