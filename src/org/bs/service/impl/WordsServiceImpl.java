package org.bs.service.impl;

import java.util.List;
import org.bs.dao.WordsDao;
import org.bs.model.Words;
import org.bs.service.WordsService;

public class WordsServiceImpl implements WordsService {
	WordsDao wordsDao;

	public void add(Words words) {
		wordsDao.save(words);
	}

	public void delete(Words words) {
		wordsDao.delete(words.getId());
	}

	public void update(Words words) {
		wordsDao.update(words);
	}

	public Words findById(int id) {
		return wordsDao.getById(id);
	}

	public Words findByUserId(int id) {
		return wordsDao.getByUserId(id);
	}

	public List<Words> search(String str) {
		return wordsDao.query(str);
	}

	public void setWordsDao(WordsDao wordsDao) {
		this.wordsDao = wordsDao;
	}
}