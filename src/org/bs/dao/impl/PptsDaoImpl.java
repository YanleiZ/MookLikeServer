package org.bs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.bs.dao.PptsDao;
import org.bs.model.Ppts;
import org.bs.utils.ConnContext;
import org.bs.utils.DB;
import org.bs.utils.PageContext;
import org.bs.dao.CourseDao;

public class PptsDaoImpl extends BaseDao implements PptsDao {
	private CourseDao courseDao = new CourseDaoImpl();

	public void save(Ppts ppts) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "insert into t_ppts (name,settime,course,descp,docts,content,img) values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ppts.getName());
			pstmt.setTimestamp(2, new java.sql.Timestamp(ppts.getSettime()
					.getTime()));
			pstmt.setInt(3, ppts.getCourse().getId());
			pstmt.setString(4, ppts.getDescp());
			pstmt.setString(5, ppts.getDocts());
			pstmt.setString(6, ppts.getContent());
			pstmt.setString(7, ppts.getImg());
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
		String sql = "delete from t_ppts where id =?";
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

	public void update(Ppts ppts) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "update t_ppts set name=?,settime=?,course=?,descp=?,docts=?,content=?,img=?"
				+ " where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ppts.getName());
			pstmt.setTimestamp(2, new java.sql.Timestamp(ppts.getSettime()
					.getTime()));
			pstmt.setInt(3, ppts.getCourse().getId());
			pstmt.setString(4, ppts.getDescp());
			pstmt.setString(5, ppts.getDocts());
			pstmt.setString(6, ppts.getContent());
			pstmt.setString(7, ppts.getImg());
			pstmt.setInt(8, ppts.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public Ppts getById(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Ppts ppts = new Ppts();
		String sql = "select * from t_ppts where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ppts.setId(rs.getInt("id"));
				ppts.setName(rs.getString("name"));
				ppts.setSettime(rs.getTimestamp("settime"));
				ppts.setCourse(courseDao.getById(rs.getInt("course")));
				ppts.setDescp(rs.getString("descp"));
				ppts.setDocts(rs.getString("docts"));
				ppts.setContent(rs.getString("content"));
				ppts.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return ppts;
	}

	public Ppts getByUserId(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Ppts ppts = new Ppts();
		String sql = "select * from t_ppts where users = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ppts.setId(rs.getInt("id"));
				ppts.setName(rs.getString("name"));
				ppts.setSettime(rs.getTimestamp("settime"));
				ppts.setCourse(courseDao.getById(rs.getInt("course")));
				ppts.setDescp(rs.getString("descp"));
				ppts.setDocts(rs.getString("docts"));
				ppts.setContent(rs.getString("content"));
				ppts.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return ppts;
	}

	public List<Ppts> query(String str) {
		List<Ppts> list = new ArrayList<Ppts>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_ppts where 1=1 ";
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
				Ppts ppts = new Ppts();
				ppts.setId(rs.getInt("id"));
				ppts.setName(rs.getString("name"));
				ppts.setSettime(rs.getTimestamp("settime"));
				ppts.setCourse(courseDao.getById(rs.getInt("course")));
				ppts.setDescp(rs.getString("descp"));
				ppts.setDocts(rs.getString("docts"));
				ppts.setContent(rs.getString("content"));
				ppts.setImg(rs.getString("img"));
				list.add(ppts);
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