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
<title>欢迎来到名言提交页面！</title>
<style type="text/css">
  body {
	background:URL(https://unsplash.it/1440/860?blur) no-repeat;
	color: #000;
	font-family: "Varela Round", Arial, Helvetica, sans-serif;
	font-size:50px;
	    background-size:100%;
	        background-attachment:fixed;
	
}
h3{
  text-align:center;
  color:green;
}
#main{
  margin-top:15%;
}
.bodys{width:800px;margin:0 auto 0 auto;}
.bodys input{ height:54px;line-height:60px;width:600px;padding:0 10px;float:left;}
.bodys .one1{ background-color:#000; }
.bodys button{float:left;border:0;height:60px;width:160px; color:#FFF; line-height:60px;text-align:center;overflow:hidden;font-size:20px;}
.bodys .one{ border:#000 3px solid}
</style>
</head>
<body>
    <div style="top:0;right:0;position:fixed;"><iframe width="420" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&color=%2300B050&icon=2&py=haerbin&num=5"></iframe></div>

<div >
<div id = "main">
 <h3>欢迎提交名言！</h3>
 <div class ="bodys">
  <s:form method="post" action="upload" autocomplete="off" id="Upload">
      <input class="one" type="text"  name="says" placeholder="欢迎提交" />
      <button class="one1">立即提交</button>
</s:form>
</div>
 </div>
</div>
</body>
</html>