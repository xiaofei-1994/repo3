<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>添加图书</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
  </head>
  
  <body>
  <h3>新增图书信息</h3>
   <form action="addBook" method="post" id="addSortForm">
   	<p>图书名称:<input type="text" name="name" id="name"/></p>
   	<p>图书作者:<input type="text" name="author" id="author"/></p>
   	<p>购买日期:<input type="text" name="buytime" id="buytime"/><span>yyyy-MM-dd格式</span></p>
   	<p>图书类别:
   		<select name="sortid">
   			<c:forEach items="${sorts }" var="sort">
   			<option value="${sort.id }">${sort.name }</option>
   			</c:forEach>
   		</select>
   	</p>
   	<input type="submit" value="新增图书"/>
   </form>
   
   <script type="text/javascript">
   	$(function(){
   		$("#addSortForm").submit(function(){
   			//名称和作者判断
   			var name = $("#name").val();
   			var author = $("#author").val();
   			
   			if(name=="" || author==""){
   			
   				alert("图书名称和作者不能为空");
   				return false;
   				
   			}
   			//日期格式判断
   			var buytiem = $("#buytime").val();
   			//js的正则表达式
   			//日期格式正则表达式 yyyy-mm-dd
   			var regex = /\d{4}-\d{2}-\d{2}/;
   			
   			if(!regex.test(buytiem)){
   				alert("购买日期不合法!");
   				return false;
   			}
   			
   			
   			
   			return true;
   		});
   		
   		
   	})
   
   </script>
  </body>
</html>
