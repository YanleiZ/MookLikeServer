package org.bs.servlet.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bs.model.DoneTest;
import org.bs.model.Member;
import org.bs.model.User;
import org.bs.service.DoneTestService;
import org.bs.service.MemberService;
import org.bs.service.TestsService;
import org.bs.utils.JDBCHandler;
import org.bs.utils.PageContext;
import org.bs.utils.ResultUtils;

public class DoneTestServlet extends BaseServlet {
	private DoneTestService doneTestService;
	private MemberService memberService;
	private TestsService testsService;

	@Override
	public void addInput(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("memberList", memberService.search(""));
		request.setAttribute("testsList", testsService.search(""));
		request.getRequestDispatcher("/backend/doneTest/add_doneTest.jsp")
				.forward(request, response);
	}

	public void prepare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("doneTestList",
				doneTestService.search(""));
	}

	@Override
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DoneTest doneTest = ResultUtils.copyParams(DoneTest.class, request);
		doneTestService.add(doneTest);
		request.getRequestDispatcher(
				"/backend/doneTest/add_doneTest_success.jsp").forward(request,
				response);
	}
	public void add1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		DoneTest doneTest = ResultUtils.copyParams(DoneTest.class, request);
		User user = (User) request.getSession().getAttribute("login_user");
		Member member = memberService.findByUserId(user.getId());
		doneTest.setMember(member);
		doneTest.setSettime(new Date());
		doneTestService.add(doneTest);
		String truestr = "{\"success\":\"true\"}";
		PrintWriter out = response.getWriter();
		out.write(truestr);
		out.flush();
		out.close();
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		doneTestService.delete(doneTestService.findById(id));
		request.getRequestDispatcher("DoneTestServlet?method=list").forward(
				request, response);
	}

	public void deleteBetch(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] doneTestIds = request.getParameterValues("doneTestCheckbox");
		for (int i = 0; i < doneTestIds.length; i++) {
			doneTestService.delete(doneTestService.findById(Integer
					.parseInt(doneTestIds[i])));
		}
		request.getRequestDispatcher("DoneTestServlet?method=list").forward(
				request, response);
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("doneTest", doneTestService.findById(id));
		request.setAttribute("memberList", memberService.search(""));
		request.setAttribute("testsList", testsService.search(""));
		request.getRequestDispatcher(
				"/backend/doneTest/update_doneTest_input.jsp").forward(request,
				response);
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("doneTest", doneTestService.findById(id));
		request.setAttribute("memberList", memberService.search(""));
		request.setAttribute("testsList", testsService.search(""));
		request.getRequestDispatcher("/backend/doneTest/show_doneTest.jsp")
				.forward(request, response);
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DoneTest doneTest = ResultUtils.copyParams(DoneTest.class, request);
		doneTestService.update(doneTest);
		request.getRequestDispatcher("DoneTestServlet?method=list").forward(
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
			request.setAttribute("doneTestList", doneTestService.search(key));
		} else {
			request.setAttribute("doneTestList", doneTestService.search(""));
		}
		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/backend/doneTest/doneTest_list.jsp")
				.forward(request, response);
	}

	public void setDoneTestService(DoneTestService doneTestService) {
		this.doneTestService = new JDBCHandler<DoneTestService>()
				.createProxy(doneTestService);
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = new JDBCHandler<MemberService>()
				.createProxy(memberService);
	}

	public void setTestsService(TestsService testsService) {
		this.testsService = new JDBCHandler<TestsService>()
				.createProxy(testsService);
	}
}