package org.bs.dao;

import java.util.List;
import org.bs.model.Words;

public interface WordsDao {
	public void save(Words words);

	public void delete(int id);

	public void update(Words words);

	public Words getById(int id);

	public List<Words> query(String str);

	public Words getByUserId(int id);
}