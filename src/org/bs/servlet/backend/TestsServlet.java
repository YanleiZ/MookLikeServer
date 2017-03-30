package org.bs.servlet.backend;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bs.model.Tests;
import org.bs.service.TestsService;
import org.bs.utils.JDBCHandler;
import org.bs.utils.PageContext;
import org.bs.utils.ResultUtils;
import org.bs.model.Course;
import org.bs.service.CourseService;

public class TestsServlet extends BaseServlet {
	private TestsService testsService;
	private CourseService courseService;

	@Override
	public void addInput(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/tests/add_tests.jsp").forward(
				request, response);
	}

	public void prepare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("testsList", testsService.search(""));
	}

	@Override
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Tests tests = ResultUtils.copyParams(Tests.class, request);
		testsService.add(tests);
		request.getRequestDispatcher("/backend/tests/add_tests_success.jsp")
				.forward(request, response);
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		testsService.delete(testsService.findById(id));
		request.getRequestDispatcher("TestsServlet?method=list").forward(
				request, response);
	}

	public void deleteBetch(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] testsIds = request.getParameterValues("testsCheckbox");
		for (int i = 0; i < testsIds.length; i++) {
			testsService.delete(testsService.findById(Integer
					.parseInt(testsIds[i])));
		}
		request.getRequestDispatcher("TestsServlet?method=list").forward(
				request, response);
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("tests", testsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/tests/update_tests_input.jsp")
				.forward(request, response);
	}
	public void content(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("tests", testsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/tests.jsp")
		.forward(request, response);
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("tests", testsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/tests/show_tests.jsp").forward(
				request, response);
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Tests tests = ResultUtils.copyParams(Tests.class, request);
		testsService.update(tests);
		request.getRequestDispatcher("TestsServlet?method=list").forward(
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
			request.setAttribute("testsList", testsService.search(key));
		} else {
			request.setAttribute("testsList", testsService.search(""));
		}
		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/backend/tests/tests_list.jsp").forward(
				request, response);
	}

	public void setTestsService(TestsService testsService) {
		this.testsService = new JDBCHandler<TestsService>()
				.createProxy(testsService);
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = new JDBCHandler<CourseService>()
				.createProxy(courseService);
	}
}