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
<title>欢迎光临！www.kuangmeng.net  | www.kuangmeng.org</title>

<script type=text/javascript>
//指定条目数
tips = new Array(110);
//条目内容
tips[0] = '生活是不公平的，你要去适应它。';
tips[1] = '送人玫瑰，手流余香。';
tips[2] = '我们有不同的籍贯、不同的年龄、不同的习惯、不同的经历，但有一点我们是相同的，那就是都有一颗：爱心。';
tips[3] = '锦上添花固然好,雪中送炭更可贵。';
tips[4] = '伸出您的友爱之手,让更多的孩子重返校园。';
tips[5] = '如果你陷入困境，那不是你父母的过错，不要将你理应承担的责任转嫁给他人，而要学着从中吸取教训。';
tips[6] = '爱心一片,真情永远。';
tips[7] = '聆听心声,实现愿望。';
tips[8] = '走出学校后的生活不像在学校一样有学期之分，也没有暑假之说。没有几位老板乐于帮你发现自我，你必须依靠自己去完成。';
tips[9] = '电视中的许多场景决不是真实的生活。在现实生活中，人们必须埋头做自己的工作，而非像电视里演的那样天天泡在咖啡馆里。';
tips[10] = '善待你所厌恶的人，因为说不定哪一天你就会为这样的一个人工作。';
tips[11] = '人生应该如蜡烛一样，从顶燃到底，一直都是光明的。 —— 萧楚女';
tips[12] = '人生的价值，即以其人对于当代所做的工作为尺度。 —— 徐玮';
tips[13] = '路是脚踏出来的，历史是人写出来的。人的每一步行动都在书写自己的历史。 —— 吉鸿昌';
tips[14] = '春蚕到死丝方尽，人至期颐亦不休。一息尚存须努力，留作青年好范畴。 —— 吴玉章';
tips[15] = '但愿每次回忆，对生活都不感到负疚 —— 郭小川';
tips[16] = '人的一生可能燃烧也可能腐朽，我不能腐朽，我愿意燃烧起来！ —— 奥斯特洛夫斯基';
tips[17] = '你若要喜爱你自己的价值，你就得给世界创造价值。 —— 歌德';
tips[18] = '社会犹如一条船，每个人都要有掌舵的准备。 —— 易卜生';
tips[19] = '人生不是一种享乐，而是一桩十分沉重的工作。 —— 列夫·托尔斯泰';
tips[20] = '人生的价值，并不是用时间，而是用深度去衡量的。 —— 列夫·托尔斯泰';
tips[21] = '生活只有在平淡无味的人看来才是空虚而平淡无味的。 —— 车尔尼雪夫斯基';
tips[22] = '一个人的价值，应该看他贡献什么，而不应当看他取得什么。 —— 爱因斯坦';
tips[23] = '人只有献身于社会，才能找出那短暂而有风险的生命的意义。 —— 爱因斯坦';
tips[24] = '芸芸众生，孰不爱生？爱生之极，进而爱群。 —— 秋瑾';
tips[25] = '生活真象这杯浓酒，不经三番五次的提炼呵，就不会这样可口！ —— 郭小川';
tips[26] = '充满着欢乐与斗争精神的人们，永远带着欢乐，欢迎雷霆与阳光。 —— 赫胥黎';
tips[27] = '春风吹柳,雨润大地。';
tips[28] = '为了生活中努力发挥自己的作用，热爱人生吧。 —— 罗丹';
tips[29] = '希望是附丽于存在的，有存在，便有希望，有希望，便是光明。 —— 鲁迅';
tips[30] = '沉沉的黑夜都是白天的前奏。 —— 郭小川';
tips[31] = '当一个人用工作去迎接光明，光明很快就会来照耀着他。 —— 冯学峰';
tips[32] = '冬天已经到来，春天还会远吗？ —— 雪莱';
tips[33] = '过去属于死神，未来属于你自己。 —— 雪莱';
tips[34] = '世间的活动，缺点虽多，但仍是美好的。 —— 罗丹';
tips[35] = '辛勤的蜜蜂永没有时间悲哀。 —— 布莱克';
tips[36] = '希望是厄运的忠实的姐妹。 —— 普希金';
tips[37] = '当你的希望一个个落空，你也要坚定，要沉着！ —— 朗费罗';
tips[38] = '先相信你自己，然后别人才会相信你。 —— 屠格涅夫';
tips[39] = '不要慨叹生活底痛苦！---慨叹是弱者...... —— 高尔基';
tips[40] = '宿命论是那些缺乏意志力的弱者的借口。 —— 罗曼·罗兰';
tips[41] = '春回人间,真情奉献。';
tips[42] = '私心胜者，可以灭公。 —— 林逋';
tips[43] = '人人好公，则天下太平；人人营私，则天下大乱。 —— 刘鹗';
tips[44] = '自私自利之心，是立人达人之障。 —— 吕坤';
tips[45] = '如烟往事俱忘却，心底无私天地宽。 —— 陶铸';
tips[46] = '常求有利别人，不求有利自己。 —— 谢觉哉';
tips[47] = '一切利己的生活，都是非理性的，动物的生活。 —— 列夫·托尔斯泰';
tips[48] = '人的理性粉碎了迷信，而人的感情也将摧毁利己主义。 —— 海涅';
tips[49] = '无私是稀有的道德，因为从它身上是无利可图的。 —— 布莱希特';
tips[50] = '君子喻于义，小人喻于利。 —— 孔丘';
tips[51] = '不戚戚于贫贱，不汲汲于富贵。 —— 陶渊明';
tips[52] = '富贵不淫贫贱乐，男儿到此是豪雄。 —— 程颢';
tips[53] = '清贫，洁白朴素的生活，正是我们革命者能够战胜许多困难的地方！ —— 方志敏';
tips[54] = '三军可夺帅也,匹夫不可夺志也。 —— 孔丘';
tips[55] = '志不强者智不达。 —— 墨翟';
tips[56] = '燕雀安知鸿鹄之志哉！ —— 陈涉';
tips[57] = '志当存高远。 —— 诸葛亮';
tips[58] = '老骥伏枥，志在千里；烈士暮年，壮心不已。 —— 曹操';
tips[59] = '燕雀戏藩柴，安识鸿鹄游。 —— 曹植';
tips[60] = '穷且益坚，不坠青云之志。 —— 王勃';
tips[61] = '大鹏一日同风起，扶摇直上九万里。 —— 李白';
tips[62] = '古之立大事者，不惟有超世之才，亦必有坚忍不拔之志。 —— 苏轼';
tips[63] = '生当作人杰，死亦为鬼雄，至今思项羽，不肯过江东。 —— 李清照';
tips[64] = '壮心未与年俱老，死去犹能作鬼雄。 —— 陆游';
tips[65] = '故立志者，为学之心也；为学者，立志之事也。 —— 王阳明';
tips[66] = '贫不足羞，可羞是贫而无志。 —— 吕坤';
tips[67] = '我们以人们的目的来判断人的活动。目的伟大，活动才可以说是伟大的。 —— 契诃夫';
tips[68] = '毫无理想而又优柔寡断是一种可悲的心理。 —— 培根';
tips[69] = '生活的理想，就是为了理想的生活。 —— 张闻天';
tips[70] = '人，只要有一种信念，有所追求，什么艰苦都能忍受，什么环境也都能适应。 —— 丁玲';
tips[71] = '理想的人物不仅要在物质需要的满足上，还要在精神旨趣的满足上得到表现。 —— 黑格尔';
tips[72] = '一个能思想的人，才真是一个力量无边的人。 —— 巴尔扎克';
tips[73] = '一个没有受到献身的热情所鼓舞的人，永远不会做出什么伟大的事情来。 —— 车尔尼雪夫斯基';
tips[74] = '共同的事业，共同的斗争，可以使人们产生忍受一切的力量。 —— 奥斯特洛夫斯基';
tips[75] = '我从来不把安逸和快乐看作是生活目的本身---这种伦理基础，我叫它猪栏的理想。 —— 爱因斯坦';
tips[76] = '在一个人民的国家中还要有一种推动的枢纽，这就是美德。 —— 孟德斯鸠';
tips[77] = '人不能象走兽那样活着，应该追求知识和美德。 —— 但丁';
tips[78] = '勿以恶小而为之，勿以善小而不为。惟贤惟德，能服于人。 —— 刘备';
tips[79] = '不患位之不尊，而患德之不崇；不耻禄之不伙，而耻智之不博。 —— 张衡';
tips[80] = '土扶可城墙，积德为厚地。 —— 李白';
tips[81] = '行一件好事，心中泰然；行一件歹事，衾影抱愧。 —— 神涵光';
tips[82] = '入于污泥而不染、不受资产阶级糖衣炮弹的侵蚀，是最难能可贵的革命品质。—— 周恩来';
tips[83] = '一个人最伤心的事情无过于良心的死灭。 —— 郭沫若';
tips[84] = '害羞是畏惧或害怕羞辱的情绪，这种情绪可以阻止人不去犯某些卑鄙的行为。 —— 斯宾诺莎';
tips[85] = '应该热心地致力于照道德行事，而不要空谈道德。 —— 德谟克利特';
tips[86] = '感情有着极大的鼓舞力量，因此，它是一切道德行为的重要前提。 —— 凯洛夫';
tips[87] = '没有伟大的品格，就没有伟大的人，甚至也没有伟大的艺术家，伟大的行动者。 —— 罗曼·罗兰';
tips[88] = '理智要比心灵为高，思想要比感情可靠。 —— 高尔基';
tips[89] = "没事可以进<a href='http://www.kuangmeng.net'>我的博客</a>去看看！——匡盟盟 ";
tips[90] = '人类被赋予了一种工作，那就是精神的成长。 —— 列夫·托尔斯泰';
tips[91] = '人在智慧上应当是明豁的，道德上应该是清白的，身体上应该是清洁的。 —— 契诃夫';
tips[92] = '良心是由人的知识和全部生活方式来决定的。 —— 马克思';
tips[93] = '不念居安思危，戒奢以俭；斯以伐根而求木茂，塞源而欲流长也。 —— 魏徵';
tips[94] = '历览前贤国与家，成由勤俭破由奢。 —— 李商隐';
tips[95] = '把“德性”教给你们的孩子：使人幸福的是德性而非金钱。这是我的经验之谈。在患难中支持我的是道德，使我不曾自杀的，除了艺术以外也是道德。 —— 贝多芬';
tips[96] = '如果道德败坏了，趣味也必然会堕落。——狄德罗';
tips[97] = '我愿证明，凡是行为善良与高尚的人，定能因之而担当患难。 —— 贝多芬';
tips[98] = '装饰对于德行也同样是格格不入的，因为德行是灵魂的力量和生气。 —— 卢梭';
tips[99] = '我深信只有有道德的公民才能向自己的祖国致以可被接受的敬礼。 —— 卢梭';
tips[100] = '如果有好的名言，记得联系：kuangmeng@msn.com哦！——匡盟盟';
tips[101] = '对于事实问题的健全的判断是一切德行的真正基础。 —— 夸美纽斯';
tips[102] = '德行的实现是由行为，不是由文字。 —— 夸美纽斯';
tips[103] = '霸祖孤身取二江，子孙多以百城降。豪华尽出成功后，逸乐安知与祸双？ —— 王安石';
tips[104] = '阴谋陷害别人的人，自己会首先遭到不幸。 —— 伊索';
tips[105] = '奢则妄取苟取，志气卑辱；一从俭约，则于人无求，于己无愧，是可以养气也。  —— 罗大经';
tips[106] = '侈则多欲。君子多欲则念慕富贵，枉道速祸。 —— 司马光';
tips[107] = '你可以点击“加入收藏”收藏你喜欢的书目哦！——匡盟盟 ';
tips[108] = '知耻近乎勇。 —— 孔丘';
tips[109] = '辱，莫大于不知耻。 —— 王通';
tips[110] = '君子忧道不忧贫。 —— 孔丘';
</script>
<link href="js/zzsc.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>

<style type="text/css">
body{font:.85em/1.2 "微软雅黑","microsoft yahei",arial;background:#f2f2f2;background:linear-gradient(left,#f2f2f2,#dddddd);background:-moz-linear-gradient(left,#f2f2f2,#dddddd);background:-webkit-linear-gradient(left,#f2f2f2,#dddddd);background:-o-linear-gradient(left,#f2f2f2,#dddddd);}
a:focus{outline:none;}
h3{text-shadow:0 2px #ccc;}
.tc{text-align:center;}
#navs{position:fixed;left:14px;bottom:14px;width:100px;height:100px;line-height:100px;font-size:2.5em;list-style-type:none;margin:0;padding:0;text-align:center;color:#fff;cursor:pointer;}
#navs>li,#navs:after{position:absolute;left:0;top:0;width:100%;height:100%;border-radius:50%;-webkit-border-radius:50%;background-color:#40CDC4;}
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
  font-size:1.2em;
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
  background-color:#EA7293;
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
	margin: 20px 20px;
	padding: 10px 20px;
	width: 100px;
}
#add  input[type="button"] {
	background-color: #33cc00;
	color: #fff;
	margin: 20px 8px;
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
/* 小火箭css */
#gotop1 {
    width: 80px;
    position: fixed;
    bottom: 90px;
    cursor: pointer;
    z-index: 99998;
    right: 50%;
    margin-right: -620px;
}

/* 小火箭悬停特效 */

#gotop1:hover {
    animation: rubberBand 1s;
}

@keyframes rubberBand {
  from {
    transform: scale3d(1, 1, 1);
  }

  30% {
    transform: scale3d(1.25, 0.75, 1);
  }

  40% {
    transform: scale3d(0.75, 1.25, 1);
  }

  50% {
    transform: scale3d(1.15, 0.85, 1);
  }

  65% {
    transform: scale3d(.95, 1.05, 1);
  }

  75% {
    transform: scale3d(1.05, .95, 1);
  }

  to {
    transform: scale3d(1, 1, 1);
  }
}

/* end 小火箭 */
</style>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":["qzone","tsina","bdysc","weixin","renren","kaixin001","tieba","douban","bdhome","sqq","ty","fbook","twi","linkedin","copy","print"],"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"1","bdPos":"left","bdTop":"107.5"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</head>
<body>
<div style="width:1200px;bottom:0;position:fixed;color:#ffff00;">
         <h4 style="float:right;margin-right:10px;">当前用户：<a href="/comment.jsp?username=<%=session.getAttribute("username")%>"><%=session.getAttribute("username")%></a></h4>
         <h4 style="float:right;margin-right:10px;">用户收藏：<a href="/collect.jsp?username=<%=session.getAttribute("username")%>"><%
            AddCollect ac=new AddCollect();
            out.print(ac.GetCollectnum(String.valueOf(session.getAttribute("username")))+"本");
         %></a></h4>
	<div id="mingyan" style="padding-bottom:20px;padding-left:50px;"><h2>每日名言：</h2>
  <script>
  index = Math.floor(Math.random() * tips.length);
  document.getElementById('mingyan').innerHTML+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/upload.jsp">'+tips[index]+'</a>';
  </script>
  </div>
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
     %>
    <div style="background:url(back.png);height:150px;width:1210px;"></div>
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
			<th>
				<%
					out.print("Operations");
				%>
			</th>
		</tr>
		<% 
		    int no=0; 
		    String in = new String();
			while (rs.next()){
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
			<td>
		    <form action="addCollect" style="float:left;margin-right:3px;margin-left:3px;"><input type="hidden" name="ISBN" value=<%=in%>><input type="hidden" name="username" value=<%=session.getAttribute("username")%>><input type="submit" value="加入收藏" ></form>
			 <form action="deleteBook" style="float:left;margin-right:3px;margin-left:3px;"><input type="hidden" name="username" value=<%=session.getAttribute("username")%>><input type="hidden" name="ISBN" value=<%=in %>><input type="submit" value="删除书目" ></form>
			<form action="updateAction" style="float:left;margin-right:3px;margin-left:3px;"><input type="hidden" name="username" value=<%=session.getAttribute("username")%>><input type="hidden" name="ISBN" value=<%=in %>><input type="submit" value="修改书目" ></form>
		 	</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
    if(no == 0){
			%>
            <p><a href="/Add.jsp"><input id="addBooks" type="submit" value="点击添加"></a></p>
			<% 
		}
	%>
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
	
  <div style="height:100px;"></div>
  
  <!-- 右侧小火箭图标返回顶部 -->
	<div id="shangxia2">
		<span id="gotop1">
			<img src="huojian.svg" alt="返回顶部小火箭">
		</span>
	</div>
	<script src="js/jquery.min.js"></script>
<script src="js/TweenMax.min.js"></script>
<script src="js/ScrollToPlugin.min.js"></script>
<script>

/* 选择你喜欢的速度类型，复制下面的某段代码即可。不明处请咨询：qpjk.cc */

$(function() {

// 默认速度
$("#gotop6").click(function() {
TweenMax.to(window, 1, {scrollTo:0});
 });
// 弹跳球式滚动底部 .box2是要滚动地方的id或者锚点
$("#gotop5").click(function() {
TweenMax.to(window, 2, {scrollTo:".box2", ease:Bounce.easeOut});
 });
// 返回顶部，绑定gotop1图标和gotop2文字事件
$("#gotop1,#gotop2").click(function(e) {
   TweenMax.to(window, 1.5, {scrollTo:0, ease: Expo.easeInOut});
   var huojian = new TimelineLite();
	huojian.to("#gotop1", 1, {rotationY:720, scale:0.6, y:"+=40", ease:  Power4.easeOut})
	.to("#gotop1", 1, {y:-1000, opacity:0, ease:  Power4.easeOut}, 0.6)
	.to("#gotop1", 1, {y:0, rotationY:0, opacity:1, scale:1, ease: Expo.easeOut, clearProps: "all"}, "1.4");
 });
// 以1秒慢快慢的速度滚动顶部
$("#gotop3").click(function() {
TweenMax.to(window, 1, {scrollTo:0, ease:Expo.easeInOut});
 });
// 以1.5秒快慢快的速度滚动顶部
$("#gotop4").click(function() {
TweenMax.to(window, 1.5, {scrollTo:0, ease:SlowMo.ease.config(0.7, 0.7, false)});
 });
});

</script>
<!-- 代码 开始 -->
<div class="go-top dn" id="go-top">
    <a href="javascript:;" class="uc-2vm"></a>
	<div class="uc-2vm-pop dn">
		<h2 class="title-2wm">微信扫一扫</h2>
		<div class="logo-2wm-box">
			<img src="images/weixin.jpg" alt="我的微信" width="240" height="240">
		</div>
	</div>
    <a href="/comment.jsp" target="_blank" class="feedback"></a>
</div>

<script>
$(function(){
	$(window).on('scroll',function(){
		var st = $(document).scrollTop();
		if( st>0 ){
			if( $('#main-container').length != 0  ){
				var w = $(window).width(),mw = $('#main-container').width();
				if( (w-mw)/2 > 70 )
					$('#go-top').css({'left':(w-mw)/2+mw+20});
				else{
					$('#go-top').css({'left':'auto'});
				}
			}
			$('#go-top').fadeIn(function(){
				$(this).removeClass('dn');
			});
		}else{
			$('#go-top').fadeOut(function(){
				$(this).addClass('dn');
			});
		}	
	});
	$('#go-top .go').on('click',function(){
		$('html,body').animate({'scrollTop':0},500);
	});

	$('#go-top .uc-2vm').hover(function(){
		$('#go-top .uc-2vm-pop').removeClass('dn');
	},function(){
		$('#go-top .uc-2vm-pop').addClass('dn');
	});
});
</script>
<!-- 代码 结束 -->
</body>
</html>