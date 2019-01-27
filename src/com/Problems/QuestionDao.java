package com.Problems;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDao {
	public Connection getCon() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://118.24.83.200:3306/Transfer?characterEncoding=UTF-8";
		Connection con=DriverManager.getConnection(url, "xhsfct","123456");
		return con;
	}
	public List<Question> queryProblems() throws Exception{
		Connection con=getCon();
		String sql="select * from problems";
		PreparedStatement pre=con.prepareStatement(sql);
		ResultSet res=pre.executeQuery();
		List<Question> list=new ArrayList<Question>();
	
		while(res.next()){
			int proId=res.getInt(1);
			String proName=res.getString(2);
			String proSelectA=res.getString(3);
			String proSelectB=res.getString(4);
			String proSelectC=res.getString(5);
			String proSelectD=res.getString(6);
			Question q=new Question(proId,proName,proSelectA,proSelectB,proSelectC,proSelectD);
			list.add(q);
		}
		
		
		for (Question qq : list) {
			System.out.println(qq);
		}
		con.close();
		return list;
		
	}
	
	
	public List<Question> queryProblems(int id) throws Exception{
		Connection con=getCon();
		String sql="select * from problems where id=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1,id);
		ResultSet res=pre.executeQuery();
		List<Question> list=new ArrayList<Question>();
	
		while(res.next()){
			int proId=res.getInt(1);
			String proName=res.getString(2);
			String proSelectA=res.getString(3);
			String proSelectB=res.getString(4);
			String proSelectC=res.getString(5);
			String proSelectD=res.getString(6);
			Question q=new Question(proId,proName,proSelectA,proSelectB,proSelectC,proSelectD);
			list.add(q);
		}
		
		
		for (Question qq : list) {
			System.out.println(qq);
		}
		con.close();
		return list;
		
	}
	
	public void increaseProblems(String problem,String selecta,String selectb,String selectc,String selectd) throws Exception{
		Connection con=getCon();
		String sql="insert into problems value(?,?,?,?,?,?,?)";
		
		System.out.println(sql);
		PreparedStatement pre=con.prepareStatement(sql);
		int id=UtilId.getIdNum();
		pre.setInt(1, id);
		pre.setInt(2, 1);
		pre.setString(3, problem);
		pre.setString(4, selecta);
		pre.setString(5, selectb);
		pre.setString(6, selectc);
		pre.setString(7, selectd);
		pre.execute();
		con.close();
	
		
		
	}
	
	public void deleteProblems(int id) throws Exception{
		Connection con=getCon();
		String sql="delete  from problems where pro_id=?";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setInt(1,id);
		boolean res=pre.execute();
		con.close();
		
	}
	
	public void updateProblems(int id,String name,String a,String b,String c,String d) throws Exception {
		Connection con=getCon();
		String sql="update Problems SET pro_name=?, pro_select_a=?, pro_select_b, pro_select_c, pro_select_d=? WHERE pro_id=? ";
		PreparedStatement pre=con.prepareStatement(sql);
		pre.setString(1,name);
		pre.setString(2,a);
		pre.setString(3,b);
		pre.setString(4,c);
		pre.setString(5,d);
		pre.setInt(6,id);
		boolean res=pre.execute();
		con.close();
	}


}
