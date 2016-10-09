<%@ page language="java" import="java.sql.*,java.io.*,java.util.*,net.kuangmeng.SQLSearch"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<link rel="Shortcut Icon" href="tubiao.jpg" >
<link rel="Bookmark" href="tubiao.jpg" >
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<meta name="format-detection" content="telephone=no,email=no"/>
<meta name="author" content="kuangmeng"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请修改书籍信息！</title> 
<style type="text/css">
  h1 {
    text-align:center;
    font-size:30px;
    font-family:Helvetica, sans-serif;
  }
  h3 {
    text-align:center;
    font-size:20px;
    font-family:Helvetica, sans-serif;
  }
  input {
	border: none;
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
	line-height: inherit;
	-webkit-appearance: none;
}
p{
	color: #777;
	margin-bottom: 30px;
}
  .black_overlay{ 
  display: none; 
  position: absolute;
  top: 0%;  left: 0%; 
  width: 100%;  height: 100%; 
  background-color: black; 
  z-index:1001;  
  -moz-opacity: 0.8; 
  opacity:.80;  
  filter: alpha(opacity=80);
  } 
  .white_content { 
  display: none; 
  position: absolute;
  top: 25%; 
  left: 25%; 
  width: 50%; 
  height: 50%; 
  padding: 16px; 
  border: 16px solid orange; 
  background-color: white; 
  z-index:1002; 
  overflow: auto; 
  } 
  #add  input[type="text"] {
	margin: 5px 10px;
	padding: 5px 10px;
	color:green;
	width: 150px;
	border: 1px solid gray; 
	
}
#add  input[type="submit"] {
	background-color: #33cc00;
	color: #fff;
	margin: 20px 20px;
	padding: 10px 20px;
	width: 100px;
}
#add  input[type="reset"] {
	background-color: #33cc00;
	color: #fff;
	margin: 20px 20px;
	padding: 10px 20px;
	width: 100px;
}
  #add  input[type="button"] {
	background-color: #33cc00;
	color: #fff;
	margin: 10px 8px;
	padding: 10px 20px;
	width: 100px;
}
</style>
</head>
<%
   String str=request.getParameter("ISBN");
%>
<body onload="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
<div id="light" class="white_content" id="add" style="text-align:center;"> 
    <div style="text-align:center;"><h1>请修改书籍信息（可部分修改）！</h1></div>
    <s:form  action="updatebookAction" id="add">
             <input name="ISBN" type="hidden"  value=<%=str%>></input>
            <label for="Title" class="tips">请修改书籍的名称：</label><input name="Title" type="text" ></input><br>
            <label for="Publisher" class="tips">请修改出版社信息：</label><input name="Publisher" type="text"></input><br>
            <label for="PublisherDate" class="tips">请修改出版的时间：</label><input name="PublisherDate" type="text"></input><br>
            <label for="Price" class="tips">请修改的书籍价格：</label><input name="Price" type="text"></input><br>
            <label for="Author" class="tips">请修改的书籍作者：</label><input name="Author" type="text"></input><br>
            <input type="submit" value="确定"/><input type="reset" value="重置"/>
            <a href="javascript:void(0)" onclick="history.go(-1)"><input type="button" value="取消"/></a>
     </s:form>
    </div> 
<div id="fade" class="black_overlay"> </div>
</body>
</html> 