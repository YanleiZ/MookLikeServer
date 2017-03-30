package org.bs.servlet.backend;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bs.model.News;
import org.bs.service.CourseService;
import org.bs.service.NewsService;
import org.bs.utils.JDBCHandler;
import org.bs.utils.PageContext;
import org.bs.utils.ResultUtils;

public class NewsServlet extends BaseServlet {
	private NewsService newsService;
	private CourseService courseService;

	@Override
	public void addInput(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/backend/news/add_news.jsp").forward(
				request, response);
	}

	public void prepare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("newsList", newsService.search(""));
	}

	@Override
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		News news = ResultUtils.copyParams(News.class, request);
		newsService.add(news);
		request.getRequestDispatcher("/backend/news/add_news_success.jsp")
				.forward(request, response);
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		newsService.delete(newsService.findById(id));
		request.getRequestDispatcher("NewsServlet?method=list").forward(
				request, response);
	}

	public void deleteBetch(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] newsIds = request.getParameterValues("newsCheckbox");
		for (int i = 0; i < newsIds.length; i++) {
			newsService.delete(newsService.findById(Integer
					.parseInt(newsIds[i])));
		}
		request.getRequestDispatcher("NewsServlet?method=list").forward(
				request, response);
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("news", newsService.findById(id));
		request.getRequestDispatcher("/backend/news/update_news_input.jsp")
				.forward(request, response);
	}
	public void content(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("news", newsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/news.jsp")
		.forward(request, response);
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("news", newsService.findById(id));
		request.getRequestDispatcher("/backend/news/show_news.jsp").forward(
				request, response);
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		News news = ResultUtils.copyParams(News.class, request);
		newsService.update(news);
		request.getRequestDispatcher("NewsServlet?method=list").forward(
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
			request.setAttribute("newsList", newsService.search(key));
		} else {
			request.setAttribute("newsList", newsService.search(""));
		}
		request.setAttribute("courseList", courseService.search(""));
		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/backend/news/news_list.jsp").forward(
				request, response);
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = new JDBCHandler<NewsService>()
				.createProxy(newsService);
	}
	public void setCourseService(CourseService courseService) {
		this.courseService = new JDBCHandler<CourseService>()
				.createProxy(courseService);
	}

}