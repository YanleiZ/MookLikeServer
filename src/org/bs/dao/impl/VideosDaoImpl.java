package org.bs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.bs.dao.VideosDao;
import org.bs.model.Videos;
import org.bs.utils.ConnContext;
import org.bs.utils.DB;
import org.bs.utils.PageContext;
import org.bs.dao.CourseDao;

public class VideosDaoImpl extends BaseDao implements VideosDao {
	private CourseDao courseDao = new CourseDaoImpl();

	public void save(Videos videos) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "insert into t_videos (name,settime,course,descp,docts,content,img) values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, videos.getName());
			pstmt.setTimestamp(2, new java.sql.Timestamp(videos.getSettime()
					.getTime()));
			pstmt.setInt(3, videos.getCourse().getId());
			pstmt.setString(4, videos.getDescp());
			pstmt.setString(5, videos.getDocts());
			pstmt.setString(6, videos.getContent());
			pstmt.setString(7, videos.getImg());
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
		String sql = "delete from t_videos where id =?";
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

	public void update(Videos videos) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "update t_videos set name=?,settime=?,course=?,descp=?,docts=?,content=?,img=?"
				+ " where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, videos.getName());
			pstmt.setTimestamp(2, new java.sql.Timestamp(videos.getSettime()
					.getTime()));
			pstmt.setInt(3, videos.getCourse().getId());
			pstmt.setString(4, videos.getDescp());
			pstmt.setString(5, videos.getDocts());
			pstmt.setString(6, videos.getContent());
			pstmt.setString(7, videos.getImg());
			pstmt.setInt(8, videos.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public Videos getById(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Videos videos = new Videos();
		String sql = "select * from t_videos where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				videos.setId(rs.getInt("id"));
				videos.setName(rs.getString("name"));
				videos.setSettime(rs.getTimestamp("settime"));
				videos.setCourse(courseDao.getById(rs.getInt("course")));
				videos.setDescp(rs.getString("descp"));
				videos.setDocts(rs.getString("docts"));
				videos.setContent(rs.getString("content"));
				videos.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return videos;
	}

	public Videos getByUserId(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Videos videos = new Videos();
		String sql = "select * from t_videos where users = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				videos.setId(rs.getInt("id"));
				videos.setName(rs.getString("name"));
				videos.setSettime(rs.getTimestamp("settime"));
				videos.setCourse(courseDao.getById(rs.getInt("course")));
				videos.setDescp(rs.getString("descp"));
				videos.setDocts(rs.getString("docts"));
				videos.setContent(rs.getString("content"));
				videos.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return videos;
	}

	public List<Videos> query(String str) {
		List<Videos> list = new ArrayList<Videos>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_videos where 1=1 ";
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
				Videos videos = new Videos();
				videos.setId(rs.getInt("id"));
				videos.setName(rs.getString("name"));
				videos.setSettime(rs.getTimestamp("settime"));
				videos.setCourse(courseDao.getById(rs.getInt("course")));
				videos.setDescp(rs.getString("descp"));
				videos.setDocts(rs.getString("docts"));
				videos.setContent(rs.getString("content"));
				videos.setImg(rs.getString("img"));
				list.add(videos);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return list;
	}
	
	public List<Videos> queryAll() {
		List<Videos> list = new ArrayList<Videos>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_videos ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PageContext.getPage().getPageIndex());
			pstmt.setInt(2, PageContext.getPage().getPageSize());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Videos videos = new Videos();
				videos.setId(rs.getInt("id"));
				videos.setName(rs.getString("name"));
				videos.setSettime(rs.getTimestamp("settime"));
				videos.setCourse(courseDao.getById(rs.getInt("course")));
				videos.setDescp(rs.getString("descp"));
				videos.setDocts(rs.getString("docts"));
				videos.setContent(rs.getString("content"));
				videos.setImg(rs.getString("img"));
				list.add(videos);
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