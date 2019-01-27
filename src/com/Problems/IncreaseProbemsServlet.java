package com.Problems;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IncreaseProbemsServlet
 */
public class IncreaseProbemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncreaseProbemsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String problem=request.getParameter("problem");
		String selecta=request.getParameter("selecta");
		String selectb=request.getParameter("selectb");
		String selectc=request.getParameter("selectc");
		String selectd=request.getParameter("selectd");
		if("".equals(selecta) ||  "".equals(selectb)  || "".equals(selectc) || "".equals(selectd)  ||  "".equals(problem)) {
			request.setAttribute("msg","选项为空，请完善选项！");
            request.getRequestDispatcher("increase.jsp").forward(request, response);
		}else {
			QuestionDao qd=new QuestionDao();
			try {
				qd.increaseProblems(problem, selecta, selectb, selectc, selectd);
				response.sendRedirect("QueryProblems");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
