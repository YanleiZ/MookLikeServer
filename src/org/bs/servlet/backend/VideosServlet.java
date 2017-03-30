package org.bs.servlet.backend;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bs.model.Videos;
import org.bs.service.VideosService;
import org.bs.utils.JDBCHandler;
import org.bs.utils.PageContext;
import org.bs.utils.ResultUtils;
import org.bs.model.Course;
import org.bs.service.CourseService;

public class VideosServlet extends BaseServlet {
	private VideosService videosService;
	private CourseService courseService;

	@Override
	public void addInput(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/videos/add_videos.jsp").forward(
				request, response);
	}

	public void prepare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("videosList",
				videosService.search(""));
	}

	@Override
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Videos videos = ResultUtils.copyParams(Videos.class, request);
		videosService.add(videos);
		request.getRequestDispatcher("/backend/videos/add_videos_success.jsp")
				.forward(request, response);
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		videosService.delete(videosService.findById(id));
		request.getRequestDispatcher("VideosServlet?method=list").forward(
				request, response);
	}

	public void deleteBetch(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] videosIds = request.getParameterValues("videosCheckbox");
		for (int i = 0; i < videosIds.length; i++) {
			videosService.delete(videosService.findById(Integer
					.parseInt(videosIds[i])));
		}
		request.getRequestDispatcher("VideosServlet?method=list").forward(
				request, response);
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("videos", videosService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/videos/update_videos_input.jsp")
				.forward(request, response);
	}
	public void content(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("videos", videosService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/videos.jsp")
		.forward(request, response);
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("videos", videosService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/videos/show_videos.jsp")
				.forward(request, response);
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Videos videos = ResultUtils.copyParams(Videos.class, request);
		videosService.update(videos);
		request.getRequestDispatcher("VideosServlet?method=list").forward(
				request, response);
	}

	@Override
	public void get(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.get(request, response);
	}

	@Override
	public void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String key = request.getParameter("key");
		if (!"".equals(key) && key != null) {
			request.setAttribute("videosList", videosService.search(key));
		} else {
			request.setAttribute("videosList", videosService.search(""));
		}
		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/backend/videos/videos_list.jsp")
				.forward(request, response);
	}

	public void setVideosService(VideosService videosService) {
		this.videosService = new JDBCHandler<VideosService>()
				.createProxy(videosService);
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = new JDBCHandler<CourseService>()
				.createProxy(courseService);
	}
}