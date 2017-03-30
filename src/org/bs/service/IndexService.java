package org.bs.service;

import java.util.List;
import org.bs.model.Index;

public interface IndexService {
	public void add(Index index);

	public void delete(Index index);

	public void update(Index index);

	public Index findById(int id);

	public Index findByUserId(int id);

	public List<Index> search(String str);
}