package com.Problems;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("userName");
		System.out.println(name);
		String psw=request.getParameter("psw");
		System.out.println(psw);
		
		QuestionDao qd=new QuestionDao();
		try {
			Connection conn=qd.getCon();
			String sql="select * from admin where ad_name=?";
			PreparedStatement pre=conn.prepareStatement(sql);
			pre.setString(1, name);
			ResultSet res=pre.executeQuery();
			String adPsw="";
			while(res.next()){
				adPsw=res.getString(3);
				System.out.println(adPsw);
			}
			if(adPsw.equals(psw)) {
				System.out.println("¿ªÊ¼"); 
				response.sendRedirect("index.html");
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ÓÐ´í");
		}
	}

}
