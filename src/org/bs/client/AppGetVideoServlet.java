package org.bs.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bs.model.Videos;
import org.bs.service.CourseService;
import org.bs.service.VideosService;
import org.bs.servlet.backend.BaseServlet;
import org.bs.utils.JDBCHandler;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class AppGetVideoServlet
 */
public class AppGetVideoServlet extends BaseServlet {
	private VideosService videosService;
	@Override
	public void get(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.get(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		List<Videos> videoList = videosService.searchAll();
		String s = JSON.toJSONString(videoList);
		
		out.print(s);
		out.flush();
		out.close();
		System.out.println(s);
		System.out.println("===");
		
	}
	public void setVideosService(VideosService videosService) {
		this.videosService = new JDBCHandler<VideosService>()
				.createProxy(videosService);
	}
}