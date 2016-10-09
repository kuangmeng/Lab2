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
<title>日期有误！</title> 
<style type="text/css">
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
  top: 35%; 
  left: 35%; 
  width: 30%; 
  height: 25%; 
  padding: 16px; 
  border: 16px solid green; 
  background-color: white; 
  z-index:1002; 
  overflow: auto; 
  } 
  #add  input[type="button"] {
	background-color: #33cc00;
	color: #fff;
	margin: 10px 8px;
	padding: 10px 20px;
	width: 100px;
}
 h1 {
    text-align:center;
    font-size:40px;
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
</style>
</head>
<body onload="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
<div id="light" class="white_content" id="add" style="text-align:center;"> 
    <div style="text-align:center;"><h1>日期格式错误！</h1></div>
    <script language="javascript">
          setTimeout(function(){
        	    history.go(-1);
        	},1000);
   </script>
    <s:form  action="updateAction" id="add">
    <a href="javascript:void(0)" onclick="history.go(-1);"><input type="button" value="返回"/></a>
    </s:form>
    </div> 
<div id="fade" class="black_overlay"> </div>
</body>
</html> 