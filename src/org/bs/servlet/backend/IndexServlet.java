package org.bs.servlet.backend;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bs.model.Index;
import org.bs.service.IndexService;
import org.bs.service.NewsService;
import org.bs.utils.JDBCHandler;
import org.bs.utils.PageContext;
import org.bs.utils.ResultUtils;
import org.bs.model.Course;
import org.bs.service.CourseService;
import org.bs.model.Ppts;
import org.bs.service.PptsService;
import org.bs.model.Videos;
import org.bs.service.VideosService;
import org.bs.model.Words;
import org.bs.service.WordsService;
import org.bs.model.Tests;
import org.bs.service.TestsService;

public class IndexServlet extends BaseServlet {
	private IndexService indexService;
	private CourseService courseService;
	private PptsService pptsService;
	private VideosService videosService;
	private WordsService wordsService;
	private TestsService testsService;
	private NewsService newsService;

	@Override
	public void addInput(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("courseList", courseService.search(""));
		request.setAttribute("pptsList", pptsService.search(""));
		request.setAttribute("videosList", videosService.search(""));
		request.setAttribute("wordsList", wordsService.search(""));
		request.setAttribute("testsList", testsService.search(""));
		request.getRequestDispatcher("/backend/index/add_index.jsp").forward(
				request, response);
	}

	public void prepare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("indexList", indexService.search(""));
	}

	@Override
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Index index = ResultUtils.copyParams(Index.class, request);
		indexService.add(index);
		request.getRequestDispatcher("/backend/index/add_index_success.jsp")
				.forward(request, response);
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		indexService.delete(indexService.findById(id));
		request.getRequestDispatcher("IndexServlet?method=list").forward(
				request, response);
	}

	public void deleteBetch(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] indexIds = request.getParameterValues("indexCheckbox");
		for (int i = 0; i < indexIds.length; i++) {
			indexService.delete(indexService.findById(Integer
					.parseInt(indexIds[i])));
		}
		request.getRequestDispatcher("IndexServlet?method=list").forward(
				request, response);
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("index", indexService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.setAttribute("pptsList", pptsService.search(""));
		request.setAttribute("videosList", videosService.search(""));
		request.setAttribute("wordsList", wordsService.search(""));
		request.setAttribute("testsList", testsService.search(""));
		request.getRequestDispatcher("/backend/index/update_index_input.jsp")
				.forward(request, response);
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("index", indexService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.setAttribute("pptsList", pptsService.search(""));
		request.setAttribute("videosList", videosService.search(""));
		request.setAttribute("wordsList", wordsService.search(""));
		request.setAttribute("testsList", testsService.search(""));
		request.getRequestDispatcher("/backend/index/show_index.jsp").forward(
				request, response);
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Index index = ResultUtils.copyParams(Index.class, request);
		indexService.update(index);
		request.getRequestDispatcher("IndexServlet?method=list").forward(
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

		request.setAttribute("courseList", courseService.search(""));
		request.setAttribute("pptsList", pptsService.search(""));
		request.setAttribute("videosList", videosService.search(""));
		request.setAttribute("wordsList", wordsService.search(""));
		request.setAttribute("testsList", testsService.search(""));
		request.setAttribute("newsList", newsService.search(""));
		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	public void course(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("courseList", courseService.search(""));
		request.setAttribute("pptsList", pptsService.search(""+id));
		request.setAttribute("videosList", videosService.search(""+id));
		request.setAttribute("wordsList", wordsService.search(""+id));
		request.setAttribute("testsList", testsService.search(""+id));
		request.setAttribute("newsList", newsService.search(""));
		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/course.jsp").forward(request, response);
	}

	public void setIndexService(IndexService indexService) {
		this.indexService = new JDBCHandler<IndexService>()
				.createProxy(indexService);
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = new JDBCHandler<CourseService>()
				.createProxy(courseService);
	}

	public void setPptsService(PptsService pptsService) {
		this.pptsService = new JDBCHandler<PptsService>()
				.createProxy(pptsService);
	}

	public void setVideosService(VideosService videosService) {
		this.videosService = new JDBCHandler<VideosService>()
				.createProxy(videosService);
	}

	public void setWordsService(WordsService wordsService) {
		this.wordsService = new JDBCHandler<WordsService>()
				.createProxy(wordsService);
	}

	public void setTestsService(TestsService testsService) {
		this.testsService = new JDBCHandler<TestsService>()
				.createProxy(testsService);
	}
	public void setNewsService(NewsService newsService) {
		this.newsService = new JDBCHandler<NewsService>()
				.createProxy(newsService);
	}
}