package com.Problems;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String psw = null;
		try {
			psw = new UserDao().findUser(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(psw ==null){
			request.setAttribute("username", username);
			request.setAttribute("msg2", "* 用户不存在");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		if(psw!=null&&!psw.equals(password)){
			request.setAttribute("username", username);
			request.setAttribute("msg3", "* 密码错误");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		if(psw.equals(password)){
			request.setAttribute("msg", "用户："+username+",登陆成功");
			request.getRequestDispatcher("regist.jsp").forward(request, response);
			//response.setHeader("Refresh","1;url=welcome.jsp");
		}
	}

}
