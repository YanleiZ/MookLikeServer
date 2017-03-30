package org.bs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.bs.dao.WordsDao;
import org.bs.model.Words;
import org.bs.utils.ConnContext;
import org.bs.utils.DB;
import org.bs.utils.PageContext;
import org.bs.dao.CourseDao;

public class WordsDaoImpl extends BaseDao implements WordsDao {
	private CourseDao courseDao = new CourseDaoImpl();

	public void save(Words words) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "insert into t_words (name,settime,course,descp,docts,content,img) values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, words.getName());
			pstmt.setTimestamp(2, new java.sql.Timestamp(words.getSettime()
					.getTime()));
			pstmt.setInt(3, words.getCourse().getId());
			pstmt.setString(4, words.getDescp());
			pstmt.setString(5, words.getDocts());
			pstmt.setString(6, words.getContent());
			pstmt.setString(7, words.getImg());
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
		String sql = "delete from t_words where id =?";
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

	public void update(Words words) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "update t_words set name=?,settime=?,course=?,descp=?,docts=?,content=?,img=?"
				+ " where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, words.getName());
			pstmt.setTimestamp(2, new java.sql.Timestamp(words.getSettime()
					.getTime()));
			pstmt.setInt(3, words.getCourse().getId());
			pstmt.setString(4, words.getDescp());
			pstmt.setString(5, words.getDocts());
			pstmt.setString(6, words.getContent());
			pstmt.setString(7, words.getImg());
			pstmt.setInt(8, words.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public Words getById(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Words words = new Words();
		String sql = "select * from t_words where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				words.setId(rs.getInt("id"));
				words.setName(rs.getString("name"));
				words.setSettime(rs.getTimestamp("settime"));
				words.setCourse(courseDao.getById(rs.getInt("course")));
				words.setDescp(rs.getString("descp"));
				words.setDocts(rs.getString("docts"));
				words.setContent(rs.getString("content"));
				words.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return words;
	}

	public Words getByUserId(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Words words = new Words();
		String sql = "select * from t_words where users = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				words.setId(rs.getInt("id"));
				words.setName(rs.getString("name"));
				words.setSettime(rs.getTimestamp("settime"));
				words.setCourse(courseDao.getById(rs.getInt("course")));
				words.setDescp(rs.getString("descp"));
				words.setDocts(rs.getString("docts"));
				words.setContent(rs.getString("content"));
				words.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return words;
	}

	public List<Words> query(String str) {
		List<Words> list = new ArrayList<Words>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_words where 1=1 ";
		if (!"".equals(str) && str != null) {
			sql += " and course = " + str + " ";
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
				Words words = new Words();
				words.setId(rs.getInt("id"));
				words.setName(rs.getString("name"));
				words.setSettime(rs.getTimestamp("settime"));
				words.setCourse(courseDao.getById(rs.getInt("course")));
				words.setDescp(rs.getString("descp"));
				words.setDocts(rs.getString("docts"));
				words.setContent(rs.getString("content"));
				words.setImg(rs.getString("img"));
				list.add(words);
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