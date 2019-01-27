package com.Problems;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	//获得连接
	public Connection getConnection() throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/shixun?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=UTC";
		Connection con=DriverManager.getConnection(url, "root","123456");
		return con;
	}

	//根据用户名查找用户密码
	public String findUser(String username) throws Exception{
		Connection con =getConnection();
		
		String psw = null;
		String sql = "select * from user where username=? ";
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if(rs.next()){
				psw=rs.getString("password");
			}else{
				psw=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (SQLException e) {		
				e.printStackTrace();
			}
		}
		return psw;
	}
	public void selectstudent(String username,String psw) throws Exception{
		Connection con =getConnection();
		String sql = "select * from user where username=? and password=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//添加用户
	public void addUser(String username,String psw) throws Exception{
		Connection con = getConnection();
		PreparedStatement pstmt =null;
		String sql = "INSERT INTO user(username,password) VALUES(?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, psw);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch (SQLException e) {	
				e.printStackTrace();
			}
		}
	}
	
	



	public static void main(String[] args) {
	
	}


}

