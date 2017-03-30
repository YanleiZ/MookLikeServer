package org.bs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.bs.dao.DoneTestDao;
import org.bs.model.DoneTest;
import org.bs.utils.ConnContext;
import org.bs.utils.DB;
import org.bs.utils.PageContext;
import org.bs.dao.MemberDao;
import org.bs.dao.TestsDao;

public class DoneTestDaoImpl extends BaseDao implements DoneTestDao {
	private MemberDao memberDao = new MemberDaoImpl();
	private TestsDao testsDao = new TestsDaoImpl();

	public void save(DoneTest doneTest) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "insert into t_doneTest (member,tests,settime) values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, doneTest.getMember().getId());
			pstmt.setInt(2, doneTest.getTests().getId());
			pstmt.setTimestamp(3, new java.sql.Timestamp(doneTest.getSettime()
					.getTime()));
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
		String sql = "delete from t_doneTest where id =?";
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

	public void update(DoneTest doneTest) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "update t_doneTest set member=?,tests=?,settime=?"
				+ " where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, doneTest.getMember().getId());
			pstmt.setInt(2, doneTest.getTests().getId());
			pstmt.setTimestamp(3, new java.sql.Timestamp(doneTest.getSettime()
					.getTime()));
			pstmt.setInt(4, doneTest.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public DoneTest getById(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DoneTest doneTest = new DoneTest();
		String sql = "select * from t_doneTest where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				doneTest.setId(rs.getInt("id"));
				doneTest.setMember(memberDao.getById(rs.getInt("member")));
				doneTest.setTests(testsDao.getById(rs.getInt("tests")));
				doneTest.setSettime(rs.getTimestamp("settime"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return doneTest;
	}

	public DoneTest getByUserId(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DoneTest doneTest = new DoneTest();
		String sql = "select * from t_doneTest where users = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				doneTest.setId(rs.getInt("id"));
				doneTest.setMember(memberDao.getById(rs.getInt("member")));
				doneTest.setTests(testsDao.getById(rs.getInt("tests")));
				doneTest.setSettime(rs.getTimestamp("settime"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return doneTest;
	}

	public List<DoneTest> query(String str) {
		List<DoneTest> list = new ArrayList<DoneTest>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_doneTest where 1=1 ";
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
				DoneTest doneTest = new DoneTest();
				doneTest.setId(rs.getInt("id"));
				doneTest.setMember(memberDao.getById(rs.getInt("member")));
				doneTest.setTests(testsDao.getById(rs.getInt("tests")));
				doneTest.setSettime(rs.getTimestamp("settime"));
				list.add(doneTest);
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