package org.bs.servlet.backend;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bs.model.Words;
import org.bs.service.WordsService;
import org.bs.utils.JDBCHandler;
import org.bs.utils.PageContext;
import org.bs.utils.ResultUtils;
import org.bs.model.Course;
import org.bs.service.CourseService;

public class WordsServlet extends BaseServlet {
	private WordsService wordsService;
	private CourseService courseService;

	@Override
	public void addInput(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/words/add_words.jsp").forward(
				request, response);
	}

	public void prepare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("wordsList", wordsService.search(""));
	}

	@Override
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Words words = ResultUtils.copyParams(Words.class, request);
		wordsService.add(words);
		request.getRequestDispatcher("/backend/words/add_words_success.jsp")
				.forward(request, response);
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		wordsService.delete(wordsService.findById(id));
		request.getRequestDispatcher("WordsServlet?method=list").forward(
				request, response);
	}

	public void deleteBetch(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] wordsIds = request.getParameterValues("wordsCheckbox");
		for (int i = 0; i < wordsIds.length; i++) {
			wordsService.delete(wordsService.findById(Integer
					.parseInt(wordsIds[i])));
		}
		request.getRequestDispatcher("WordsServlet?method=list").forward(
				request, response);
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("words", wordsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/words/update_words_input.jsp")
				.forward(request, response);
	}
	public void content(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("words", wordsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/words.jsp")
		.forward(request, response);
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("words", wordsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/words/show_words.jsp").forward(
				request, response);
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Words words = ResultUtils.copyParams(Words.class, request);
		wordsService.update(words);
		request.getRequestDispatcher("WordsServlet?method=list").forward(
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
			request.setAttribute("wordsList", wordsService.search(key));
		} else {
			request.setAttribute("wordsList", wordsService.search(""));
		}
		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/backend/words/words_list.jsp").forward(
				request, response);
	}

	public void setWordsService(WordsService wordsService) {
		this.wordsService = new JDBCHandler<WordsService>()
				.createProxy(wordsService);
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = new JDBCHandler<CourseService>()
				.createProxy(courseService);
	}
}