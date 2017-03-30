package org.bs.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.bs.dao.impl.UserDaoImpl;
import org.bs.model.Member;
import org.bs.model.Role;
import org.bs.model.User;
import org.bs.service.MemberService;
import org.bs.service.RoleService;
import org.bs.service.UserService;
import org.bs.servlet.backend.BaseServlet;
import org.bs.utils.JDBCHandler;
import org.bs.utils.ResultUtils;

/**
 * Servlet implementation class AppRegisterServlet
 */
public class AppRegisterServlet extends BaseServlet {
	UserDaoImpl userDao = new UserDaoImpl();
	private MemberService memberService;
	private UserService userService;
	private RoleService roleService;

	@Override
	public void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		//判断用户名是否存在
		String username = req.getParameter("username");
		User user1 = userService.findByUserName(username);
		if (user1 != null){
			out.print(false+"|###|"+"exist");
			return;
		}
		
		Member member = ResultUtils.copyParams(Member.class, req);
		User user = new User();
		
			try {
				BeanUtils.copyProperties(user, member);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		user.setRole(member.getRoles());
		String password = req.getParameter("password");
		user.setPassword(password);
		Role role = roleService.findById(2);
		user.setRole(role);
		userService.add(user);
		member.setUsers(user);
		memberService.add(member);	

		System.out.println("注册成功！");
		
		out.print(true+"|###|"+"no");
		out.flush();
		out.close();
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = new JDBCHandler<MemberService>()
				.createProxy(memberService);
	}

	public void setUserService(UserService userService) {
		this.userService = new JDBCHandler<UserService>()
				.createProxy(userService);
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = new JDBCHandler<RoleService>()
				.createProxy(roleService);
	}

}
