package org.bs.servlet.backend;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bs.model.Ppts;
import org.bs.service.PptsService;
import org.bs.utils.JDBCHandler;
import org.bs.utils.PageContext;
import org.bs.utils.ResultUtils;
import org.bs.model.Course;
import org.bs.service.CourseService;

public class PptsServlet extends BaseServlet {
	private PptsService pptsService;
	private CourseService courseService;

	@Override
	public void addInput(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/ppts/add_ppts.jsp").forward(
				request, response);
	}

	public void prepare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("pptsList", pptsService.search(""));
	}

	@Override
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Ppts ppts = ResultUtils.copyParams(Ppts.class, request);
		pptsService.add(ppts);
		request.getRequestDispatcher("/backend/ppts/add_ppts_success.jsp")
				.forward(request, response);
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		pptsService.delete(pptsService.findById(id));
		request.getRequestDispatcher("PptsServlet?method=list").forward(
				request, response);
	}

	public void deleteBetch(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] pptsIds = request.getParameterValues("pptsCheckbox");
		for (int i = 0; i < pptsIds.length; i++) {
			pptsService.delete(pptsService.findById(Integer
					.parseInt(pptsIds[i])));
		}
		request.getRequestDispatcher("PptsServlet?method=list").forward(
				request, response);
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("ppts", pptsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/ppts/update_ppts_input.jsp")
				.forward(request, response);
	}
	public void content(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("ppts", pptsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/ppts.jsp")
		.forward(request, response);
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("ppts", pptsService.findById(id));
		request.setAttribute("courseList", courseService.search(""));
		request.getRequestDispatcher("/backend/ppts/show_ppts.jsp").forward(
				request, response);
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Ppts ppts = ResultUtils.copyParams(Ppts.class, request);
		pptsService.update(ppts);
		request.getRequestDispatcher("PptsServlet?method=list").forward(
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
			request.setAttribute("pptsList", pptsService.search(key));
		} else {
			request.setAttribute("pptsList", pptsService.search(""));
		}
		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/backend/ppts/ppts_list.jsp").forward(
				request, response);
	}

	public void setPptsService(PptsService pptsService) {
		this.pptsService = new JDBCHandler<PptsService>()
				.createProxy(pptsService);
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = new JDBCHandler<CourseService>()
				.createProxy(courseService);
	}
}