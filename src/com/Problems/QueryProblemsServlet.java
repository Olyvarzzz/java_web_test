package com.Problems;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QueryProblemsServlet
 */
public class QueryProblemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		QuestionDao qd=new QuestionDao();
		List<Question> list = null;
		try {
			list=qd.queryProblems();
			request.setAttribute("question", list);
			System.out.println(list);
			request.getRequestDispatcher("search.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
