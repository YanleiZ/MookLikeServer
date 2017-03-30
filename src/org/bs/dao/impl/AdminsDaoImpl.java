package org.bs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.bs.dao.AdminsDao;
import org.bs.model.Admins;
import org.bs.utils.ConnContext;
import org.bs.utils.DB;
import org.bs.utils.PageContext;
import org.bs.dao.UserDao;

public class AdminsDaoImpl extends BaseDao implements AdminsDao {
	private UserDao userDao = new UserDaoImpl();

	public void save(Admins admins) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "insert into t_admins (name,sex,age,tel,address,email,users) values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admins.getName());
			pstmt.setString(2, admins.getSex());
			pstmt.setString(3, admins.getAge());
			pstmt.setString(4, admins.getTel());
			pstmt.setString(5, admins.getAddress());
			pstmt.setString(6, admins.getEmail());
			pstmt.setInt(7, admins.getUsers().getId());
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
		String sql = "delete from t_admins where id =?";
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

	public void update(Admins admins) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "update t_admins set name=?,sex=?,age=?,tel=?,address=?,email=?,users=?"
				+ " where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admins.getName());
			pstmt.setString(2, admins.getSex());
			pstmt.setString(3, admins.getAge());
			pstmt.setString(4, admins.getTel());
			pstmt.setString(5, admins.getAddress());
			pstmt.setString(6, admins.getEmail());
			pstmt.setInt(7, admins.getUsers().getId());
			pstmt.setInt(8, admins.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public Admins getById(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Admins admins = new Admins();
		String sql = "select * from t_admins where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				admins.setId(rs.getInt("id"));
				admins.setName(rs.getString("name"));
				admins.setSex(rs.getString("sex"));
				admins.setAge(rs.getString("age"));
				admins.setTel(rs.getString("tel"));
				admins.setAddress(rs.getString("address"));
				admins.setEmail(rs.getString("email"));
				admins.setUsers(userDao.getById(rs.getInt("users")));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return admins;
	}

	public Admins getByUserId(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Admins admins = new Admins();
		String sql = "select * from t_admins where users = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				admins.setId(rs.getInt("id"));
				admins.setName(rs.getString("name"));
				admins.setSex(rs.getString("sex"));
				admins.setAge(rs.getString("age"));
				admins.setTel(rs.getString("tel"));
				admins.setAddress(rs.getString("address"));
				admins.setEmail(rs.getString("email"));
				admins.setUsers(userDao.getById(rs.getInt("users")));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return admins;
	}

	public List<Admins> query(String str) {
		List<Admins> list = new ArrayList<Admins>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_admins where 1=1 ";
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
				Admins admins = new Admins();
				admins.setId(rs.getInt("id"));
				admins.setName(rs.getString("name"));
				admins.setSex(rs.getString("sex"));
				admins.setAge(rs.getString("age"));
				admins.setTel(rs.getString("tel"));
				admins.setAddress(rs.getString("address"));
				admins.setEmail(rs.getString("email"));
				admins.setUsers(userDao.getById(rs.getInt("users")));
				list.add(admins);
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