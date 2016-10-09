<%@ page language="java" import="java.sql.*,java.io.*,java.util.*,net.kuangmeng.SearchAction" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":["qzone","tsina","bdysc","weixin","renren","kaixin001","tieba","douban","bdhome","sqq","ty","fbook","twi","linkedin","copy","print"],"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"1","bdPos":"left","bdTop":"107.5"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
<link rel="Shortcut Icon" href="tubiao.jpg" >
<link rel="Bookmark" href="tubiao.jpg" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到填写<s:property value="Author"/>的个人信息页面！</title>
<style type="text/css">
@charset "utf-8";
 input {
	border: none;
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
	line-height: inherit;
	-webkit-appearance: none;
}
#add  input[type="text"] {
	margin: 10px 20px;
	padding: 10px 20px;
	width: 600px;
}
#add  input[type="submit"] {
	background-color: #33cc00;
	color: #fff;
	margin: 20px 20px;
	padding: 20px 20px;
	width: 160px;
}
#add{
    text-align:center;
}

 h1 {
    text-align:center;
    font-size:50px;
    font-family:Helvetica, sans-serif;
  }
body{font:.85em/1.2 "微软雅黑","microsoft yahei",arial;}
a {
text-decoration:none;
}
body {
	background:URL(https://unsplash.it/1900/1420?blur) no-repeat;
	font-family: "Varela Round", Arial, Helvetica, sans-serif;
	width:1000px;
	margin:100px auto;
    padding:50px auto;
     background-size:100%;
            background-attachment:fixed;
    
}

</style>
</head>
<body>
     <div style="top:0;right:0;position:fixed;"><iframe width="420" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&color=%2300B050&icon=2&py=haerbin&num=5"></iframe></div>
    <div style="background:url(addauthor.png);height:150px;"></div>
    <div id="add">
     <s:form  action="addAuthorAction" id="AddAuthor">
            <label for="Name"></label><input name="Name" type="hidden" value=<s:property value="Author"/>></input><br>
            <label for="Age">请输入<s:property value="Author"/>的年龄：</label><input name="Age" type="text"/><br>
            <label for="Author">请输入<s:property value="Author"/>的国家：</label><input name="Country" type="text"/><br>
            <input type="submit" value="进行添加"/>
          </s:form>
    </div>
    <div style="top:0px;position:fixed;">
       <h4 >当前用户：<a href="/comment.jsp?username=<%=session.getAttribute("username")%>"><%=session.getAttribute("username")%></a></h4><br>
 </div>
</body>
</html>