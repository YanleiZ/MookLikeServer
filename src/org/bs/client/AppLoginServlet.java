package org.bs.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bs.dao.impl.UserDaoImpl;
import org.bs.model.User;

/**
 * Servlet implementation class AppLogin
 */
public class AppLoginServlet extends HttpServlet {
	UserDaoImpl userDao = new UserDaoImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		 resp.setContentType("text/html");  
	        PrintWriter out = resp.getWriter();  
	        Boolean flag = false;    
	        String userName = req.getParameter("un");  
	        String password = req.getParameter("pw"); 
	        String loginFlag = userDao.appLogin(userName, password);
	        if(loginFlag.equals("success"))
	        {
	        	flag = true;
	        }
	        else flag = false;
	        System.out.println("userName:"+userName+" password:"+password);
	       //“|###|”是分隔符，一般来说考虑到暴力破解客户端不需要显示密码错误还是用户名不存在，返回去备用
	        out.print(flag+"|###|"+loginFlag);  
	        out.flush();  
	        out.close(); 
	}

}
