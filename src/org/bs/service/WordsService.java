package org.bs.service;

import java.util.List;
import org.bs.model.Words;

public interface WordsService {
	public void add(Words words);

	public void delete(Words words);

	public void update(Words words);

	public Words findById(int id);

	public Words findByUserId(int id);

	public List<Words> search(String str);
}