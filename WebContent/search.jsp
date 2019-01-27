<%@page import="com.Problems.Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
   
    String path=request.getContextPath();
   int port= request.getServerPort();
    String name="http://"+request.getServerName()+":"+port+path+"/";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/sdmenu.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
</head>
<body>

     <div class="right"  id="mainFrame">
     
     <div class="right_cont">
<ul class="breadcrumb">当前位置：
  <a href="#">首页</a> <span class="divider">/</span>
  <a href="#">题目管理</a> <span class="divider">/</span>
  题目查询
</ul>
   <div class="title_right"><strong>题目查询</strong></div>
   
   <a href="" class="btn btn-outline-primary btn-sm">新增</a>   <br/>

<table class="table table-dark table-hover">
<tr>
<td>题目ID</td>
<td>题目</td>
<td>选项A</td>
<td>选项B</td>
<td>选项C</td>
<td>选项D</td>
<td>操作</td>
</tr>
<c:forEach items="${question }" var="q">
<tr>
<td>${q.proId }</td>
<td>${q.proName }</td>
<td>${q.proSelectA }</td>
<td>${q.proSelectB }</td>
<td>${q.proSelectC }</td>
<td>${q.proSelectD }</td>
<td>
<a href="http://localhost:8080/QnSystem/DeleteProblems?id=${q.proId }">删除</a>

</td>
</tr>
</c:forEach>


</table>
</body>
</html>