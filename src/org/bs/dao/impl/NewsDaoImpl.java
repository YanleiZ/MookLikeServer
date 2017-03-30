package org.bs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.bs.dao.NewsDao;
import org.bs.model.News;
import org.bs.utils.ConnContext;
import org.bs.utils.DB;
import org.bs.utils.PageContext;

public class NewsDaoImpl extends BaseDao implements NewsDao {
	public void save(News news) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "insert into t_news (name,img,settime,descp,content) values(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, news.getName());
			pstmt.setString(2, news.getImg());
			pstmt.setTimestamp(3, new java.sql.Timestamp(news.getSettime()
					.getTime()));
			pstmt.setString(4, news.getDescp());
			pstmt.setString(5, news.getContent());
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
		String sql = "delete from t_news where id =?";
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

	public void update(News news) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		String sql = "update t_news set name=?,img=?,settime=?,descp=?,content=?"
				+ " where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, news.getName());
			pstmt.setString(2, news.getImg());
			pstmt.setTimestamp(3, new java.sql.Timestamp(news.getSettime()
					.getTime()));
			pstmt.setString(4, news.getDescp());
			pstmt.setString(5, news.getContent());
			pstmt.setInt(6, news.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
		}
	}

	public News getById(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		News news = new News();
		String sql = "select * from t_news where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				news.setId(rs.getInt("id"));
				news.setName(rs.getString("name"));
				news.setImg(rs.getString("img"));
				news.setSettime(rs.getTimestamp("settime"));
				news.setDescp(rs.getString("descp"));
				news.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return news;
	}

	public News getByUserId(int id) {
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		News news = new News();
		String sql = "select * from t_news where users = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				news.setId(rs.getInt("id"));
				news.setName(rs.getString("name"));
				news.setImg(rs.getString("img"));
				news.setSettime(rs.getTimestamp("settime"));
				news.setDescp(rs.getString("descp"));
				news.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			DB.close(pstmt);
			DB.close(rs);
		}
		return news;
	}

	public List<News> query(String str) {
		List<News> list = new ArrayList<News>();
		Connection conn = ConnContext.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_news where 1=1 ";
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
				News news = new News();
				news.setId(rs.getInt("id"));
				news.setName(rs.getString("name"));
				news.setImg(rs.getString("img"));
				news.setSettime(rs.getTimestamp("settime"));
				news.setDescp(rs.getString("descp"));
				news.setContent(rs.getString("content"));
				list.add(news);
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