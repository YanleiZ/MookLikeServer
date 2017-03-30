package org.bs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.bs.dao.IndexDao;
import org.bs.model.Index;
import org.bs.utils.ConnContext;
import org.bs.utils.DB;
import org.bs.utils.PageContext;
import org.bs.dao.CourseDao;
import org.bs.dao.PptsDao;
import org.bs.dao.VideosDao;
import org.bs.dao.WordsDao;
import org.bs.dao.TestsDao;

public class IndexDaoImpl extends BaseDao implements IndexDao {
	private CourseDao courseDao = new CourseDaoImpl();
	private PptsDao pptsDao = new PptsDaoImpl();
	private VideosDao videosDao = new VideosDaoImpl();
	private WordsDao wordsDao = new WordsDaoImpl();
	private TestsDao testsDao = new TestsDaoImpl();

	public void save(Index index) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "insert into t_index (course,ppts,videos,words,tests) values(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index.getCourse().getId());
			pstmt.setInt(2, index.getPpts().getId());
			pstmt.setInt(3, index.getVideos().getId());
			pstmt.setInt(4, index.getWords().getId());
			pstmt.setInt(5, index.getTests().getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public void delete(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "delete from t_index where id =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public void update(Index index) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "update t_index set course=?,ppts=?,videos=?,words=?,tests=?"
				+ " where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index.getCourse().getId());
			pstmt.setInt(2, index.getPpts().getId());
			pstmt.setInt(3, index.getVideos().getId());
			pstmt.setInt(4, index.getWords().getId());
			pstmt.setInt(5, index.getTests().getId());
			pstmt.setInt(6, index.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public Index getById(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Index index = new Index();
		String sql = "select * from t_index where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index.setId(rs.getInt("id"));
				index.setCourse(courseDao.getById(rs.getInt("course")));
				index.setPpts(pptsDao.getById(rs.getInt("ppts")));
				index.setVideos(videosDao.getById(rs.getInt("videos")));
				index.setWords(wordsDao.getById(rs.getInt("words")));
				index.setTests(testsDao.getById(rs.getInt("tests")));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return index;
	}

	public Index getByUserId(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Index index = new Index();
		String sql = "select * from t_index where users = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index.setId(rs.getInt("id"));
				index.setCourse(courseDao.getById(rs.getInt("course")));
				index.setPpts(pptsDao.getById(rs.getInt("ppts")));
				index.setVideos(videosDao.getById(rs.getInt("videos")));
				index.setWords(wordsDao.getById(rs.getInt("words")));
				index.setTests(testsDao.getById(rs.getInt("tests")));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return index;
	}

	public List<Index> query(String str) {
		List<Index> list = new ArrayList<Index>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_index where 1=1 ";
		if (!"".equals(str) && str != null) {
			sql += " and name like '%" + str + "%' ";
		}
		String sqlRecordsCount = "select count(*)"
				+ sql.substring(sql.indexOf("from"));
		sql += " limit ?,?";
		PageContext.getPage().setRecordsCount(
				getRecordsCount(sqlRecordsCount, new Class[] {},
						new Object[] {}));
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PageContext.getPage().getPageIndex());
			pstmt.setInt(2, PageContext.getPage().getPageSize());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Index index = new Index();
				index.setId(rs.getInt("id"));
				index.setCourse(courseDao.getById(rs.getInt("course")));
				index.setPpts(pptsDao.getById(rs.getInt("ppts")));
				index.setVideos(videosDao.getById(rs.getInt("videos")));
				index.setWords(wordsDao.getById(rs.getInt("words")));
				index.setTests(testsDao.getById(rs.getInt("tests")));
				list.add(index);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return list;
	}
}