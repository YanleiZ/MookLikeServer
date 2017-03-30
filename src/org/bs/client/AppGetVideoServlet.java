package org.bs.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bs.service.CourseService;
import org.bs.service.VideosService;
import org.bs.servlet.backend.BaseServlet;
import org.bs.utils.JDBCHandler;

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
		System.out.println("===");
		
	}
	public void setVideosService(VideosService videosService) {
		this.videosService = new JDBCHandler<VideosService>()
				.createProxy(videosService);
	}
}
