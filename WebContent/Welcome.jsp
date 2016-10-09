<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":["qzone","tsina","bdysc","weixin","renren","kaixin001","tieba","douban","bdhome","sqq","ty","fbook","twi","linkedin","copy","print"],"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"1","bdPos":"left","bdTop":"107.5"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

<link rel="Shortcut Icon" href="tubiao.jpg" >
<link rel="Bookmark" href="tubiao.jpg" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎光临！关于网站的介绍</title>
<style type="text/css">
@charset "utf-8";
body {
	background:URL(1200.jpg) no-repeat;
	color: #6600ff;
	font-family: "Varela Round", Arial, Helvetica, sans-serif;
	 background-size:100%;
	 background-attachment:fixed;
	
}
   input {
	border: none;
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
	line-height: inherit;
	-webkit-appearance: none;
}
#choose  input[type="button"] {
	background-color: #33cc00;
	color: #fff;
	margin: 20px 20px;
	padding: 20px 20px;
	width: 160px;
}
#choose{
    text-align:center;
}
a {
text-decoration:none;
}
</style>
</head>
<body >
    <div>
    <h1 style = "text-align:center"> 欢迎“<s:property value="username"/>”光临我的图书馆</h1>
    </div>
    <p style = "text-align:center">这是我的一个博客网站，如果感兴趣，你可以瞅瞅！</p>
    <div style="height:500px;weight:500px;text-align:center;">
    <iframe src="http://www.kuangmeng.net" width="60%" height="100%  iframeborder="0"></iframe>
    </div>
    <div id="choose">
    <input type="button" name="pre" value="返回登录" onclick="javascript:window.location='index.jsp';" />
    <input type="button" name="next" value="继续前进" onclick="javascript:window.location='top.jsp';" />
    </div>
     <%  
              String name=request.getParameter("username");  
              session.setAttribute("username",name);  
       %> 
     <div style="float:left;">
         <h4 style="float:left;margin-left:250px;">当前用户：<a href="/comment.jsp?username=<%=session.getAttribute("username")%>"><s:property value="username"/></a></h4><br>
    </div>
</body>
</html>