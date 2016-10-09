<%@ page language="java" import="java.sql.*,java.io.*,java.util.*,net.kuangmeng.SearchAction" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":["qzone","tsina","bdysc","weixin","renren","kaixin001","tieba","douban","bdhome","sqq","ty","fbook","twi","linkedin","copy","print"],"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"1","bdPos":"left","bdTop":"107.5"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,100italic,300italic,400italic|Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Raleway:400,200,300,500,600,800,700,900' rel='stylesheet' type='text/css'>
<link href="js/style.css" rel='stylesheet' type='text/css' />
<link rel="Shortcut Icon" href="tubiao.jpg" >
<link rel="Bookmark" href="tubiao.jpg" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到留言页面！</title>
<style type="text/css">
body {
	background:URL(1420.jpg) no-repeat;
	font-family: "Varela Round", Arial, Helvetica, sans-serif;
	width:1000px;
	margin:0px auto;
    padding:0px auto;
        background-size:100%;
            background-attachment:fixed
    
}

</style>
</head>
<body >
    <div style="top:0;right:0;position:fixed;"><iframe width="420" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&color=%2300B050&icon=2&py=haerbin&num=5"></iframe></div>
	<h1>欢迎“<%=session.getAttribute("username")%>”留言</h1>
	<div class="login-01">
			<form action="addcomment" method="post" id="AddComment">
			   <input type="hidden" name="username" value="<%=session.getAttribute("username")%>">
			<ul>
				<li class="first">
					<a href="#" class=" icon user"></a><input type="text" class="text" name="name" placeholder="昵称" >
				</li>
				<li class="first">
					<a href="#" class=" icon email"></a><input type="text" class="text" name="email" placeholder="邮箱">
				</li>
				<li class="first">
					<a href="#" class=" icon phone"></a><input type="text" class="text" name="topic" placeholder="主题">
				</li>
				<li class="second">
				<a href="#" class=" icon msg"></a><textarea name="comment" placeholder="请留下评论！"></textarea>
				</li>
			</ul>
			<input type="submit" value="立即提交" >
		</form>
</div>  
</body>
</html>