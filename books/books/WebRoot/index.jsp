<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
  </head>
  
  <body>
  <p>
  <a href="addBookUi">新增图书</a>
  </p>
  <table border="1" width="95%" style="margin:10px auto;">
  	<caption>图书信息</caption>
  	<thead>
  		<tr>
  			<td>序号</td>
  			<td>图书名称</td>
  			<td>图书作者</td>
  			<td>购买时间</td>
  			<td>分类</td>
  			<td>操作</td>
  		</tr>
  	</thead>
  	
  	<tbody>
  		<c:forEach items="${bookpage.list }" var="book" varStatus="vs">
  		
  		<tr 
  		<c:if test="${vs.count%2==0}">
  		style="background:red"
  		</c:if>
  		>
	  			<td>${vs.count }</td>
	  			<td>${book.name }</td>
	  			<td>${book.author }</td>
	  			<td>${book.buytime }</td>
	  			<td>${book.sortname }</td>
	  			<td><a href="javascript:void(0);" onclick="delBook(${book.id})">删除</a></td>
  		</tr>
  		</c:forEach>
  	
  		<tr>
  			<td colspan="6">
  			【${bookpage.currNo }/${bookpage.totalPage }】
  			<c:if test="${bookpage.currNo>1 }">
	  			<a href ="bookinfo?currNo=1" >首页</a>
	  			<a href ="bookinfo?currNo=${bookpage.currNo-1 }" >上一页</a>
  			</c:if>
  			<c:if test="${bookpage.currNo < bookpage.totalPage }">
	  			<a href="bookinfo?currNo=${bookpage.currNo+1 }">下一页</a>
	  			<a href ="bookinfo?currNo=${bookpage.totalPage }" >尾页</a>
  			</c:if>
  			
  			
  			总条数: ${bookpage.totalCount }
  			
  			</td>
  		</tr>
  	</tbody>
  
  </table>
  
  <script type="text/javascript">
  
  function delBook(id){
	 if(confirm("确定要删除吗?")){
		 $.ajax({
				"url":"delBook",
				"type":"POST",
				"data":{
					"id":id
				},
				"dataType":"json",
				"success":function(result){
					if(result.msg=="true"){
						//刷新列表
						location.href='bookinfo';
					}else{
						alert("删除失败!");	
					}
				}
			});
	 }
  }
  </script>
  </body>
</html>
