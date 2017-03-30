package org.bs.servlet.backend;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bs.model.Admins;
import org.bs.service.AdminsService;
import org.bs.utils.JDBCHandler;
import org.bs.utils.PageContext;
import org.bs.utils.ResultUtils;
import org.bs.model.User;
import org.bs.service.UserService;
import java.io.File;
import jxl.Workbook;
import jxl.write.Label;
import java.util.List;
import jxl.format.VerticalAlignment;
import jxl.format.Alignment;
import jxl.write.WritableCellFormat;
import jxl.CellView;
import jxl.write.WritableFont;
import jxl.format.UnderlineStyle;
import org.bs.utils.SystemFunction;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class AdminsServlet extends BaseServlet {
	private AdminsService adminsService;
	private UserService userService;

	@Override
	public void addInput(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("usersList", userService.search(""));
		request.getRequestDispatcher("/backend/admins/add_admins.jsp").forward(
				request, response);
	}

	public void prepare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("adminsList",
				adminsService.search(""));
	}

	@Override
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Admins admins = ResultUtils.copyParams(Admins.class, request);
		adminsService.add(admins);
		request.getRequestDispatcher("/backend/admins/add_admins_success.jsp")
				.forward(request, response);
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		adminsService.delete(adminsService.findById(id));
		request.getRequestDispatcher("AdminsServlet?method=list").forward(
				request, response);
	}

	public void deleteBetch(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String[] adminsIds = request.getParameterValues("adminsCheckbox");
		for (int i = 0; i < adminsIds.length; i++) {
			adminsService.delete(adminsService.findById(Integer
					.parseInt(adminsIds[i])));
		}
		request.getRequestDispatcher("AdminsServlet?method=list").forward(
				request, response);
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("admins", adminsService.findById(id));
		request.setAttribute("usersList", userService.search(""));
		request.getRequestDispatcher("/backend/admins/update_admins_input.jsp")
				.forward(request, response);
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("admins", adminsService.findById(id));
		request.setAttribute("usersList", userService.search(""));
		request.getRequestDispatcher("/backend/admins/show_admins.jsp")
				.forward(request, response);
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Admins admins = ResultUtils.copyParams(Admins.class, request);
		adminsService.update(admins);
		request.getRequestDispatcher("AdminsServlet?method=list").forward(
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
			request.setAttribute("adminsList", adminsService.search(key));
		} else {
			request.setAttribute("adminsList", adminsService.search(""));
		}
		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/backend/admins/admins_list.jsp")
				.forward(request, response);
	}

	public void add1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException,
			InvocationTargetException {
		Admins admins = ResultUtils.copyParams(Admins.class, request);
		User user = new User();
		BeanUtils.copyProperties(user, admins);
		user.setRole(admins.getRoles());
		String password = request.getParameter("password");
		user.setPassword(password);
		userService.add(user);
		admins.setUsers(user);
		adminsService.add(admins);
		request.getRequestDispatcher("/backend/admins/add_admins_success.jsp")
				.forward(request, response);
	}

	public void modify1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("login_user");
		request.setAttribute("admins", adminsService.findByUserId(user.getId()));
		request.setAttribute("userList", userService.search(""));
		request.getRequestDispatcher("/backend/admins/update_admins_input.jsp")
				.forward(request, response);
	}

	public void dayin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Admins> adminss = adminsService.search("");

		String realPath = this.getServletContext().getRealPath("/upload_file");
		String realPathImage = this.getServletContext().getRealPath(
				"/upload_image");
		try {
			// 打开文件
			WritableWorkbook book = Workbook.createWorkbook(new File(realPath
					+ "/" + "管理员信息表.xls"));
			// 生成名为“第一页”的工作表，参数 0 表示这是第一页
			WritableSheet sheet = book.createSheet(" 第一页 ", 0);
			jxl.write.WritableFont wfcNav = new jxl.write.WritableFont(
					WritableFont.ARIAL, 10, WritableFont.NO_BOLD, false,
					UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
			WritableCellFormat wcfN = new WritableCellFormat(wfcNav);
			wcfN.setAlignment(Alignment.CENTRE); // 设置水平对齐
			wcfN.setWrap(true); // 设置自动换行
			wcfN.setVerticalAlignment(VerticalAlignment.CENTRE);
			// 设置垂直对齐
			CellView cellView = new CellView();
			// cellView.setSize(5000);
			// 设置列宽自动大小
			cellView.setAutosize(true);
			// 在 Label 对象的构造子中指名单元格位置是第一列第一行(0,0)
			// 以及单元格内容为 test
			// 将定义好的单元格添加到工作表中
			sheet.setColumnView(0, cellView);
			Label label0 = new Label(0, 0, " 主键 ", wcfN);
			sheet.addCell(label0);
			sheet.setColumnView(1, cellView);
			Label label1 = new Label(1, 0, " 姓名 ", wcfN);
			sheet.addCell(label1);
			sheet.setColumnView(2, cellView);
			Label label2 = new Label(2, 0, " 性别 ", wcfN);
			sheet.addCell(label2);
			sheet.setColumnView(3, cellView);
			Label label3 = new Label(3, 0, " 年龄 ", wcfN);
			sheet.addCell(label3);
			sheet.setColumnView(4, cellView);
			Label label4 = new Label(4, 0, " 联系电话 ", wcfN);
			sheet.addCell(label4);
			sheet.setColumnView(5, cellView);
			Label label5 = new Label(5, 0, " 住址 ", wcfN);
			sheet.addCell(label5);
			sheet.setColumnView(6, cellView);
			Label label6 = new Label(6, 0, " 邮箱 ", wcfN);
			sheet.addCell(label6);
			sheet.setColumnView(7, cellView);
			Label label7 = new Label(7, 0, " 登录用户 ", wcfN);
			sheet.addCell(label7);

			int i = 0;
			for (Admins e : adminss) {
				i += 1;
				jxl.write.Number llabel0 = new jxl.write.Number(0, i,
						e.getId(), wcfN);
				sheet.addCell(llabel0);
				Label llabel1 = new Label(1, i, e.getName(), wcfN);
				sheet.addCell(llabel1);
				Label llabel2 = new Label(2, i, e.getSex(), wcfN);
				sheet.addCell(llabel2);
				Label llabel3 = new Label(3, i, e.getAge(), wcfN);
				sheet.addCell(llabel3);
				Label llabel4 = new Label(4, i, e.getTel(), wcfN);
				sheet.addCell(llabel4);
				Label llabel5 = new Label(5, i, e.getAddress(), wcfN);
				sheet.addCell(llabel5);
				Label llabel6 = new Label(6, i, e.getEmail(), wcfN);
				sheet.addCell(llabel6);
				Label llabel7 = new Label(7, i, e.getUsers().getUsername(),
						wcfN);
				sheet.addCell(llabel7);
			}

			// 写入数据并关闭文件
			book.write();
			book.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		request.setAttribute("page", PageContext.getPage());
		request.getRequestDispatcher("/backend/admins/admins_dayin_success.jsp")
				.forward(request, response);
	}

	public void setAdminsService(AdminsService adminsService) {
		this.adminsService = new JDBCHandler<AdminsService>()
				.createProxy(adminsService);
	}

	public void setUserService(UserService userService) {
		this.userService = new JDBCHandler<UserService>()
				.createProxy(userService);
	}
}