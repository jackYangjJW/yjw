<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName()
+ ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <script type="text/javascript" src="<%=basePath %>/js/jquery-3.3.1.min.js"></script>
    <link href="<%=basePath %>js/layui/css/layui.css" rel="stylesheet"/>
    <link href="<%=basePath %>css/style.css" rel="stylesheet"/>
     
</head>

<body class="layui-bg-gray" >
<!-- 读者登录 -->
<div class="login-main layui-anim layui-anim-fadein">
    <header class="layui-elip">读者登录</header>
    <form class="layui-form" action="<%=basePath %>/loginReader.action" method="post">
        <div class="layui-input-inline">
            <input type="text" name="readerid" id="readerid" required lay-verify="required" placeholder="账号" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" id="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
        </div>
        <hr/>
        <!--<div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-primary">QQ登录</button>
        </div> window.location.href="<%=basePath%>/login.action"; 
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-normal">微信登录</button>
        </div>-->
        <p><a href="javascript:;" class="fl"></a><a href="<%=basePath %>/login.action"" class="fr">管理登录</a></p>
        <p id="message" style="text-align: center;">${Rmsg }</p>
    </form>
</div>
</body>
<script type="text/javascript" src="<%=basePath %>/js/layui/layui.js"></script>

<script type="text/javascript">
    // 判断是登录账号和密码是否为空
    function check(){
        var usercode = $("#usercode").val();
        var password = $("#password").val();
        if(usercode=="" || password==""){
            $("#message").text("账号或密码不能为空！");
            return false;
        }
        return true;
    }

</script>
</html>