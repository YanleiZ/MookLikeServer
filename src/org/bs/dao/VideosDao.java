package org.bs.dao;

import java.util.List;
import org.bs.model.Videos;

public interface VideosDao {
	public void save(Videos videos);

	public void delete(int id);

	public void update(Videos videos);

	public Videos getById(int id);

	public List<Videos> query(String str);

	public Videos getByUserId(int id);
}