<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%
   //路径
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>首页</title>
	 <link href="<%=basePath %>/js/layui/css/layui.css" rel="stylesheet"/>

    <script type="text/javascript" src="<%=basePath %>/js/layui/layui.js"></script>
    <script type="text/javascript" src="<%=basePath %>/js/jquery-3.3.1.min.js"></script>
   
	<style type="text/css">

#imgg{
	width: 220px;
	height: 220px;
}
#xx{
display: none;
}
#xxb{
display: none;
margin: 0 auto;
text-align: center;
}
#p1{
font-size: 20px;
margin-bottom:22px;
margin-left:38px;
}
.xxb{
text-align: left;

}
.layui-layout-admin .layui-header {
   background-color: #393D49;
}
	</style>
</head>
<body class="layui-bg-gray" >
<!-- 本体 -->
<div class="layui-layout-admin ">
    <!--头部-->
    <div class="layui-header layui-anim layui-anim-scale">
        <a href="#" class="layui-logo layui-anim layui-anim-scaleSpring"style="font-size: 22px">图书管理系统</a>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="#" class="layui-anim"><i class="layui-icon" style="font-size: 20px;color: #5FB878;">&#xe612;</i>&nbsp;${User.username}</a>
                <dl class="layui-nav-child">
                    <dd id="test1"><a href="#">个人信息</a></dd>
                    <dd id="test2" onclick="editUser(${User.userid})"><a href="#">修改信息</a></dd><hr/>
                    <dd><a href="<%=basePath %>/logout">退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <!--左侧-->
    <div class="layui-side layui-bg-black layui-anim layui-anim-up">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree ">
                <li class="layui-nav-item">
                    <a href="javascript:;" >读者管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=basePath %>/toReader.action" target="menuFrame"><i class="layui-icon" style="color: #F0F0F0;">&#xe60a;</i>&nbsp;读者信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                     <a href="javascript:;">图书管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=basePath %>/toBook.action" target="menuFrame" ><i class="layui-icon">&#xe60a;</i>&nbsp;图书信息</a></dd>


                    </dl>
                </li>
                <li class="layui-nav-item">
                     <a href="javascript:;">借阅管理</a>
                   	<dl class="layui-nav-child">
                        <dd><a href="<%=basePath %>/toBorrow.action" target="menuFrame" ><i class="layui-icon">&#xe60a;</i>&nbsp;借阅信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="<%=basePath %>/tologin.action" target="menuFrame">登录读者测试</a>
                </li>
                <li class="layui-nav-item">
                    <a href="#">修改密码</a>
                    <dl class="layui-nav-child">
                        <dd ><a href="#" id="pwd"><i class="layui-icon">&#xe60a;</i>&nbsp;修改密码(登陆者)</a></dd>
                       <!-- <dd><a href="<%=basePath %>/ReaderPwd.action" target="menuFrame" ><i class="layui-icon">&#xe60a;</i>&nbsp;修改读者密码</a></dd>--> 
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!--中间主体-->
    <div class="layui-body">
         <iframe id="menuFrame" name="menuFrame" src="<%=basePath %>/tohome.action" style="overflow:visible;"
         scrolling="yes" frameborder="no" width="100%" height="99%"></iframe>     
    </div>
    <!--底部-->
    <div class="layui-footer" style="height: 51px;">
      <p style="text-align: center;"> Copyright© 2018.10-2019.12 <a href="<%=basePath %>/yangjingwen">杨景文</a>&nbsp;毕业设计 </p>
    </div>
</div>
<!-- 用户修改表 -->
<div id="xx">
<form class="layui-form" id="edit_u" style="margin-top: 20px;">
    <div class="layui-form-item">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-inline">
            <input type="text" id="U11"  name="userid" placeholder="${User.userid }" autocomplete="off" class="layui-input" readonly="readonly">
        </div>
        <div class="layui-form-mid layui-word-aux">*不可修改</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" id="U22" name="usercode"   placeholder="${User.usercode }" autocomplete="off" class="layui-input" readonly="readonly">
        </div>
         <div class="layui-form-mid layui-word-aux">*不可修改</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>
        <div class="layui-input-inline">
            <input type="text" id="U33"  name="username" placeholder="${User.username }" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机</label>
        <div class="layui-input-inline">
            <input type="text" id="U44" lay-verify="phone" name="phone" placeholder="${User.phone }" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="email" id="U55" lay-verify="email" name="email" placeholder="${User.email }" autocomplete="off" class="layui-input" >
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn"  lay-submit lay-filter="formDemo">修改</button>
        </div>
    </div>
</form>
</div>
<!-- 用户信息表 -->
<div id="xxb">
     <img src="<%=basePath %>/images/yuan1.png" class="layui-nav-img layui-anim-rotate" id="imgg"/><hr style="height: 2px"/>
   	<div class="xxb">
		<p id="p1"><strong>&nbsp;&nbsp;&nbsp;ID:&nbsp;&nbsp;</strong><span>${User.userid }</span></p><hr/>
		<p id="p1"><strong>账号:&nbsp;&nbsp;</strong><span>${User.usercode }</span></p><hr/>
		<p id="p1"><strong>昵称:&nbsp;&nbsp;</strong><span>${User.username }</span></p><hr/>
		<p id="p1"><strong>手机:&nbsp;&nbsp;</strong><span>${User.phone }</span></p><hr/>
		<p style="font-size: 20px;margin-left:38px;"><strong>邮箱:&nbsp;&nbsp;</strong><span>${User.email }</span></p>
 	</div>
</div>
<!-- 修改密码 -->
<div id="editpwd" style="display: none;">
<form class="layui-form layui-form-pane" id="editpassword" action=""style="margin:15% 0 0 40%;;">
	<div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="text" name="userid" value="${User.userid }" autocomplete="off"  style="display: none;">
      <input type="text" name="password"  required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
    <button class="layui-btn" lay-submit lay-filter="formDemo1">修改</button>
  </div>
</form>

</div>
<script>
//保存修改
    layui.use('element', function(){
        var element = layui.element();
        element.init()
     });
    layui.use(['form','layer'], function(){
  	  var form = layui.form,
  	 	 layer=layui.layer;
  	  
  	  //监听提交
  	  form.on('submit(formDemo)', function(data){
  		$.post("<%=basePath %>/returnXg.action",
  				$("#edit_u").serialize(),
  						function(data){
  					if(data =="OK"){
  						layer.msg('修改成功!', {icon:1,time:1111},function(){location.reload();});
  					
  					}else{
  						layer.msg('修改失败!', {icon:2,time:1111},function(){location.reload();});	
  					}
  				});
  	    return false;
  	  });
  	//监听提交
	  form.on('submit(formDemo1)', function(data){
		  layer.confirm('修改密码需要重新登录!',function(){
		$.post("<%=basePath%>/returnXg.action",
				$("#editpassword").serialize(),
						function(data){
				        if(data =="OK"){
				        	layer.msg('修改成功!', {icon:1,time:666},function(){location.reload();});
				        }else{
				        	layer.msg('修改失败!', {icon:2,time:666},function(){location.reload();});
				        }
			 });
		  });
	    return false;
	  });
  	});
    //修改弹出表单
    $('#test2').on('click', function(){
    	layui.use('layer', function(){
    	 var layer = layui.layer;
       		 layer.open({
       			 title:"修改",
		          type: 1,
		          area: ['400px', '390px'],
		          shadeClose: true, //点击遮罩关闭
		          content: $('#xx')
        });
      });
    });
    //修改密码弹出
    $('#pwd').on('click', function(){
    	layui.use('layer', function(){
    	 var layer = layui.layer;
       		 layer.open({
       			 title:"修改密码",
		          type: 1,
		          id:'editpw',
		          offset: 'rb',
		          area: ['87%', '92%'],
		          move: false,//禁止拖拽
		          shade: 0.1,//关闭遮罩
		          anim: 3,
		          shadeClose: true, //点击遮罩关闭
		          content: $('#editpwd')
        });
      });
    });
    //用户信息表单单
    $('#test1').on('click', function(){
    	layui.use('layer', function(){
    	 var layer = layui.layer;
       		 layer.open({
		          type: 1,
		          area: ['300px', '570px'],
		          shadeClose: true, //点击遮罩关闭
		          content: $('#xxb')
        });
      });
    });
    //修改用户
    function editUser(id) {
		$.ajax({
			type:"get",
			url:"<%=basePath %>/userId.action",
			data:{"id":id},
			success:function(data){
				$("#U11").val(data.userid)
				$("#U22").val(data.usercode);
				$("#U33").val(data.username);
				$("#U44").val(data.phone);
				$("#U55").val(data.email);
			}
		})
	}    
</script>
</body>
</html>
