package org.bs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.bs.dao.TestsDao;
import org.bs.model.Tests;
import org.bs.utils.ConnContext;
import org.bs.utils.DB;
import org.bs.utils.PageContext;
import org.bs.dao.CourseDao;

public class TestsDaoImpl extends BaseDao implements TestsDao {
	private CourseDao courseDao = new CourseDaoImpl();

	public void save(Tests tests) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "insert into t_tests (name,settime,course,descp,timucontent,daancontent) values(?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tests.getName());
			pstmt.setTimestamp(2, new java.sql.Timestamp(tests.getSettime()
					.getTime()));
			pstmt.setInt(3, tests.getCourse().getId());
			pstmt.setString(4, tests.getDescp());
			pstmt.setString(5, tests.getTimucontent());
			pstmt.setString(6, tests.getDaancontent());
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
		String sql = "delete from t_tests where id =?";
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

	public void update(Tests tests) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "update t_tests set name=?,settime=?,course=?,descp=?,timucontent=?,daancontent=?"
				+ " where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tests.getName());
			pstmt.setTimestamp(2, new java.sql.Timestamp(tests.getSettime()
					.getTime()));
			pstmt.setInt(3, tests.getCourse().getId());
			pstmt.setString(4, tests.getDescp());
			pstmt.setString(5, tests.getTimucontent());
			pstmt.setString(6, tests.getDaancontent());
			pstmt.setInt(7, tests.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public Tests getById(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Tests tests = new Tests();
		String sql = "select * from t_tests where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				tests.setId(rs.getInt("id"));
				tests.setName(rs.getString("name"));
				tests.setSettime(rs.getTimestamp("settime"));
				tests.setCourse(courseDao.getById(rs.getInt("course")));
				tests.setDescp(rs.getString("descp"));
				tests.setTimucontent(rs.getString("timucontent"));
				tests.setDaancontent(rs.getString("daancontent"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return tests;
	}

	public Tests getByUserId(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Tests tests = new Tests();
		String sql = "select * from t_tests where users = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				tests.setId(rs.getInt("id"));
				tests.setName(rs.getString("name"));
				tests.setSettime(rs.getTimestamp("settime"));
				tests.setCourse(courseDao.getById(rs.getInt("course")));
				tests.setDescp(rs.getString("descp"));
				tests.setTimucontent(rs.getString("timucontent"));
				tests.setDaancontent(rs.getString("daancontent"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return tests;
	}

	public List<Tests> query(String str) {
		List<Tests> list = new ArrayList<Tests>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_tests where 1=1 ";
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
				Tests tests = new Tests();
				tests.setId(rs.getInt("id"));
				tests.setName(rs.getString("name"));
				tests.setSettime(rs.getTimestamp("settime"));
				tests.setCourse(courseDao.getById(rs.getInt("course")));
				tests.setDescp(rs.getString("descp"));
				tests.setTimucontent(rs.getString("timucontent"));
				tests.setDaancontent(rs.getString("daancontent"));
				list.add(tests);
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