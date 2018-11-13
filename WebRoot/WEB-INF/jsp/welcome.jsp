<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
   //路径
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页面</title>
	 <link href="<%=basePath %>/js/layui/css/layui.css" rel="stylesheet"/>
	<script type="text/javascript" src="<%=basePath %>/js/layui/layui.js"></script>
	<style type="text/css">
	.main {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    width: 500px;
    margin: 0 auto;
}
	.m {
    position: fixed;
    top: 20px;
    right: 0;
    bottom: 0;
    left: 0;
    margin: 0 auto;
}
.ss{
	text-align: center; 
	margin-top:250px;
	font-size: 50px; 
}
	</style>
</head>
<body class="layui-bg-gray" >
<div class="layui-container"> 
<blockquote class="layui-elem-quote" style="margin-top: 10px;">
  <span id="mytime"></span>
</blockquote>
</div>
<div class="main">
 		<div class="layui-anim layui-anim-up layui-anim-scaleSpring ss ">
 			<i class="layui-icon layui-anim layui-anim-up" style="font-size: 50px;color: #5FB878;">&#xe65b;</i>爱看图书管理系统<i class="layui-icon layui-anim layui-anim-up" style="font-size: 50px;color: #5FB878">&#xe65a;</i>
 		</div>
</div>  
<script type="text/javascript">
function showTime(){
    nowtime=new Date();
    year=nowtime.getFullYear();
    month=nowtime.getMonth()+1;
    date=nowtime.getDate();
    document.getElementById("mytime").innerText=year+"年"+month+"月"+date+" "+nowtime.toLocaleTimeString();
}

setInterval("showTime()",1000);
</script>
</body>
</html>