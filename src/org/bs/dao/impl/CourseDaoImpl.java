package org.bs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.bs.dao.CourseDao;
import org.bs.model.Course;
import org.bs.utils.ConnContext;
import org.bs.utils.DB;
import org.bs.utils.PageContext;

public class CourseDaoImpl extends BaseDao implements CourseDao {
	public void save(Course course) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "insert into t_course (name,descp,img) values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, course.getName());
			pstmt.setString(2, course.getDescp());
			pstmt.setString(3, course.getImg());
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
		String sql = "delete from t_course where id =?";
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

	public void update(Course course) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "update t_course set name=?,descp=?,img=?"
				+ " where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, course.getName());
			pstmt.setString(2, course.getDescp());
			pstmt.setString(3, course.getImg());
			pstmt.setInt(4, course.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public Course getById(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Course course = new Course();
		String sql = "select * from t_course where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				course.setId(rs.getInt("id"));
				course.setName(rs.getString("name"));
				course.setDescp(rs.getString("descp"));
				course.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return course;
	}

	public Course getByUserId(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Course course = new Course();
		String sql = "select * from t_course where users = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				course.setId(rs.getInt("id"));
				course.setName(rs.getString("name"));
				course.setDescp(rs.getString("descp"));
				course.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return course;
	}

	public List<Course> query(String str) {
		List<Course> list = new ArrayList<Course>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_course where 1=1 ";
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
				Course course = new Course();
				course.setId(rs.getInt("id"));
				course.setName(rs.getString("name"));
				course.setDescp(rs.getString("descp"));
				course.setImg(rs.getString("img"));
				list.add(course);
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