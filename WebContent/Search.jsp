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
<title>欢迎使用搜索！</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".bodys p").not(":first").hide();
	$(".searchbox ul li").mouseover(function(){
		var index = $(this).index();
		if(index==0){
			$(this).find("a").addClass("style1");
			$("li").eq(1).find("a").removeClass("style2");
			$("li").eq(2).find("a").removeClass("style3");
		}
		if(index==1){
			$(this).find("a").addClass("style2");
			$("li").eq(0).find("a").removeClass("style1");
			$("li").eq(2).find("a").removeClass("style3");
		}
		if(index==2){
			$(this).find("a").addClass("style3");
			$("li").eq(0).find("a").removeClass("style1");
			$("li").eq(1).find("a").removeClass("style2");
		}
		var index=$(this).index();
		$(".bodys p").eq(index).show().siblings().hide();
	});
});
</script>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
/* searchbox */
.searchbox{width:650px;height:100px;margin:20px auto 0 auto;}
.searchbox ul{ height:50px; width:500px; list-style:none; margin-left:20px}
.searchbox ul li{ float:left}
.searchbox ul li a{ float:left; line-height:50px; padding:0 20px; text-decoration:none; color:#000; font-size:20px; font-weight:bold;}
.searchbox ul li .style1{ background-color:#000; color:#fff}
.searchbox ul li .style2{ background-color:#f00;color:#fff}
.searchbox ul li .style3{ background-color:#F90;color:#fff}
.bodys input{ height:54px;line-height:60px;width:450px;padding:0 10px;float:left;}
.bodys .one{ border:#000 3px solid}
.bodys .two{ border:#f00 3px solid}
.bodys .three{ border:#F90 3px solid}
.bodys .one1{ background-color:#000; }
.bodys .two2{ background-color:#f00;}
.bodys .three3{ background-color:#F90;}
.bodys button{float:left;border:0;height:60px;width:160px; color:#FFF; line-height:60px;text-align:center;overflow:hidden;font-size:20px;}
a {
text-decoration:none;
}
body {
	background:URL(https://unsplash.it/1440/860?blur) no-repeat;
	color: #000;
	font-family: "Varela Round", Arial, Helvetica, sans-serif;
	    background-size:100%;
	
}
h3{
  text-align:center;
  color:green;
}
#main{
font-size:50px;
  margin-top:10%;
}
</style>
</head>
<body >
    <div style="top:0;right:0;position:fixed;"><iframe width="420" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&color=%2300B050&icon=2&py=haerbin&num=5"></iframe></div>

<div id="main"><h3>欢迎使用搜索！</h3></div>
<div class="searchbox">
	<ul class="border1">
		<li><a href="#" class="style1">作品</a></li>
		<li><a href="#">作者</a></li>
		<li><a href="#">出版社</a></li>
	</ul>
	<div class="bodys">
		<s:form action="searchAction" id="SearchForm">
		<p><input  name="msg" type="text" class="one" placeholder="输入作品" /><button class="one1">搜索</button></p>
		<p><input name="msg2" type="text"  class="two" placeholder="输入作者" /><button class="two2">搜索</button></p>
		<p><input name="msg3" type="text"  class="three" placeholder="输入出版社" /><button class="three3">搜索</button></p></s:form>
	</div>
</div>	
<div class="searchbox">
       <h4 style="margin-top:100px;">当前用户：<a href="/comment.jsp?username=<%=session.getAttribute("username")%>"><%=session.getAttribute("username")%></a></h4><br>
</div>
</body>
</html>
