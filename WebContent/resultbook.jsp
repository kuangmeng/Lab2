<%@ page language="java" import="java.sql.*,java.io.*,java.util.*,net.kuangmeng.SQLSearch,net.kuangmeng.AddCollect,net.kuangmeng.SearchAction"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<link rel="Shortcut Icon" href="tubiao.jpg" >
<link rel="Bookmark" href="tubiao.jpg" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-touch-fullscreen" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<meta name="format-detection" content="telephone=no,email=no"/>
<meta name="author" content="kuangmeng"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>以下是查询结果！</title>
<style type="text/css">
body{font:.85em/1.2 "微软雅黑","microsoft yahei",arial;background:#f2f2f2;background:linear-gradient(left,#f2f2f2,#dddddd);background:-moz-linear-gradient(left,#f2f2f2,#dddddd);background:-webkit-linear-gradient(left,#f2f2f2,#dddddd);background:-o-linear-gradient(left,#f2f2f2,#dddddd);}
a:focus{outline:none;}
h3{text-shadow:0 2px #ccc;}
.tc{text-align:center;}
#navs{position:fixed;left:14px;bottom:14px;width:100px;height:100px;line-height:100px;font-size:2.5em;list-style-type:none;margin:0;padding:0;text-align:center;color:#fff;cursor:pointer;}
#navs>li,#navs:after{position:absolute;left:0;top:0;width:100%;height:100%;border-radius:50%;-webkit-border-radius:50%;background-color:#4ECDC4;}
#navs>li{transition:all .6s;-webkit-transition:all .6s;-moz-transition:.6s;}
#navs:after{content:attr(data-close);z-index:1;border-radius:50%;-webkit-border-radius:50%;}
#navs.active:after{content:attr(data-open);}
#navs a{width:100px;height:100px;display:inline-block;border-radius:50%;-webkit-border-radius:50%;text-decoration:none;color:#fff;}   
#customers
{
  font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
  width:100%;
  border-collapse:collapse;
  }

#customers td, #customers th 
  {
  font-size:1.5em;
  padding:3px 7px 2px 7px;
  background-color:#A79042;
  color:#000000;
  }

#customers th 
  {
  font-size:1.8em;
  text-align:left;
  padding-top:5px;
  padding-bottom:4px;
  background-color:#A7C942;
  color:#ffffff;
  }

#customers tr.alt td 
  {
  color:#000000;
  background-color:#996633;
  }
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
input[id="addBooks"] {
	background-color: #33cc00;
	color: #fff;
	display: block;
	margin: 0 auto;
	padding: 4px 0;
	width: 200px;
	height:100px;
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
	margin: 10px 20px;
	padding: 10px 20px;
	width: 100px;
}
#customers  input[type="submit"] {
	background-color: #33cc00;
	color: #fff;
	margin: 5px 5px;
	padding: 5px 5px;
	width: 80px;
}
#add  input[type="reset"] {
	background-color: #33cc00;
	color: #fff;
	margin: 10px 20px;
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
a {
text-decoration:none;
color:#ccffff;
}
body {
	background:URL(1500.jpg) no-repeat;
	font-family: "Varela Round", Arial, Helvetica, sans-serif;
	width:1210px;
	margin:50px auto;
    padding:50px auto;
        background-size:100%;
            background-attachment:fixed;
    
}
</style>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":["qzone","tsina","bdysc","weixin","renren","kaixin001","tieba","douban","bdhome","sqq","ty","fbook","twi","linkedin","copy","print"],"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"1","bdPos":"left","bdTop":"107.5"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</head>
<body>
    <div style="top:0;right:0;position:fixed;"><iframe width="420" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&color=%2300B050&icon=2&py=haerbin&num=5"></iframe></div>

<div style="width:1200px;bottom:0;position:fixed;color:#ffff00;">
         <h4 style="float:right;margin-right:10px;">当前用户：<a href="/comment.jsp?username=<%=session.getAttribute("username")%>"><%=session.getAttribute("username")%></a></h4>
         <h4 style="float:right;margin-right:10px;">用户收藏：<a href="/collect.jsp?username=<%=session.getAttribute("username")%>"><%
            AddCollect ac=new AddCollect();
            out.print(ac.GetCollectnum(String.valueOf(session.getAttribute("username")))+"本");
         %></a></h4>
  </div>
     <%
        SQLSearch ss=new SQLSearch();
        ResultSet rs= ss.getResult();
        ResultSet au= ss.getAuthor();
        int userctrl=ss.getUserCtrl(String.valueOf(session.getAttribute("username")));
        String[] name=new String[100];
        int index=1;
        while(au.next()){
        	name[index++]=au.getString("Name");
        }
        String book = request.getParameter("msg");
        %>
      <div style="height:200px;width:1210px;background:url(search.png);"><div class="clock" style="margin-top:50px;padding-top:50px;"></div></div>
	  <table align="center" id ="customers" border="0" cellpadding="100px" cellspacing="0">
		<tr>
			<th>
				<%
					out.print("ISBN");
				%>
			</th>
			<th>
				<%
					out.print("Title");
				%>
			</th>
			<th>
				<%
					out.print("Publisher");
				%>
			</th>
			<th>
				<%
					out.print("PublishDate");
				%>
			</th>
			<th>
				<%
					out.print("Price");
				%>
			</th>
			<th>
				<%
					out.print("Author");
				%>
			</th>
		</tr>
		<% 
		    int no=0; 
		     String in = new String();
			while (rs.next()){
				if(rs.getString("Title").equals(book)){
				no++;
				if(no%2==0){
		%>
		<tr class = "alt">
			<td>
				<%
				}else{
					%>
		<tr>
		     <td>
				<%
				}
					out.print(rs.getString(1));
					in=rs.getString(1);
				%>
			</td>
			<td><a href="/book.jsp?books=<%=in %>">
				<%
					out.print(rs.getString(2));
				%>
				</a>
			</td>
			<td><a href="/publisher.jsp?publisher=<%=in %>">
				<%
					out.print(rs.getString(3));
				%></a>
			</td>
			<td>
				<%
					out.print(rs.getDate(4));
				%>
			</td>
			<td>
				<%
					out.print(rs.getDouble(5));
				    int num=rs.getInt(6);
				%>
			</td>
			<td><a href="/author.jsp?author=<%=num %>">
				<% 
					out.print(name[num]);
				%></a>
			</td>
		</tr>
		<%
			}
		}
		%>
	</table>
	<%
	if(no==0 && book!=null){
			%>
			
<script>
	location.href="bookmsg.jsp";
</script>
<%} %>

	<ul id="navs" data-open="回退" data-close="导航">
	<li><a href="/Search.jsp">查询</a></li>
	<li><a href="/Add.jsp">添加</a></li>
	<li><a href="http://www.kuangmeng.net">彩蛋</a></li>
	<li><a href="/top.jsp">首页</a></li>
</ul>
   
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
(function(){
	var ul=$("#navs"),li=$("#navs li"),i=li.length,n=i-1,r=240;
	ul.click(function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')){
			for(var a=0;a<i;a++){
				li.eq(a).css({
					'transition-delay':""+(50*a)+"ms",
					'-webkit-transition-delay':""+(50*a)+"ms",
					'-o-transition-delay':""+(50*a)+"ms",
					'transform':"translate("+(r*Math.cos(90/n*a*(Math.PI/180)))+"px,"+(-r*Math.sin(90/n*a*(Math.PI/180)))+"px",
					'-webkit-transform':"translate("+(r*Math.cos(90/n*a*(Math.PI/180)))+"px,"+(-r*Math.sin(90/n*a*(Math.PI/180)))+"px",
					'-o-transform':"translate("+(r*Math.cos(90/n*a*(Math.PI/180)))+"px,"+(-r*Math.sin(90/n*a*(Math.PI/180)))+"px",
					'-ms-transform':"translate("+(r*Math.cos(90/n*a*(Math.PI/180)))+"px,"+(-r*Math.sin(90/n*a*(Math.PI/180)))+"px"
				});
			}
		}else{
			li.removeAttr('style');
		}
	});
})($);
</script>
</body>

</html>