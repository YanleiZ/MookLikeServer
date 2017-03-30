package org.bs.service;

import java.util.List;
import org.bs.model.Ppts;

public interface PptsService {
	public void add(Ppts ppts);

	public void delete(Ppts ppts);

	public void update(Ppts ppts);

	public Ppts findById(int id);

	public Ppts findByUserId(int id);

	public List<Ppts> search(String str);
}