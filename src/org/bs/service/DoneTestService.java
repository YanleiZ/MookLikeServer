package org.bs.service;

import java.util.List;
import org.bs.model.DoneTest;

public interface DoneTestService {
	public void add(DoneTest doneTest);

	public void delete(DoneTest doneTest);

	public void update(DoneTest doneTest);

	public DoneTest findById(int id);

	public DoneTest findByUserId(int id);

	public List<DoneTest> search(String str);
}