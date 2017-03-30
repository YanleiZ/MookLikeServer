package org.bs.service;

import java.util.List;
import org.bs.model.Tests;

public interface TestsService {
	public void add(Tests tests);

	public void delete(Tests tests);

	public void update(Tests tests);

	public Tests findById(int id);

	public Tests findByUserId(int id);

	public List<Tests> search(String str);
}