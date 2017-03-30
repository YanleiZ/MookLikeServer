package org.bs.service;

import java.util.List;
import org.bs.model.Videos;

public interface VideosService {
	public void add(Videos videos);

	public void delete(Videos videos);

	public void update(Videos videos);

	public Videos findById(int id);

	public Videos findByUserId(int id);

	public List<Videos> search(String str);
}