<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
            <%
   //路径
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link href="<%=basePath %>/js/layui/css/layui.css" rel="stylesheet"/>
 	<script src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
 
</head>
<body class="layui-bg-gray" >
<div class="layui-container" style="margin-top:60px ">
<form class="layui-form" id="addReader" >
  <div class="layui-form-item">
    <label class="layui-form-label">读者姓名</label>
    <div class="layui-input-block">
      <input type="text" name="name"  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">电话</label>
    <div class="layui-input-block">
      <input type="text" name="phone" lay-verify="phone" placeholder="请输入手机号吗" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">院系</label>
    <div class="layui-input-block">
      <select name="dp" lay-verify="required">
        <option value=""></option>
         <c:forEach items="${You}" var="y">
       		 <option>${y.readerdp }</option>
       	</c:forEach>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
      <input type="text" name="password" lay-verify="" value="123456"autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="男" title="男" checked>
      <input type="radio" name="sex" value="女" title="女">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</div>
</body>
<script type="text/javascript" src="<%=basePath %>/js/layui/layui.js"></script>
<script type="text/javascript">

layui.use(['form','layer'], function(){
	  var form = layui.form,
	 	 layer=layui.layer;
	  
	  //监听提交
	  form.on('submit(formDemo)', function(data){
		$.post("<%=basePath%>/createReader.action",
				$("#addReader").serialize(),
						function(data){
				        if(data =="OK"){
				        	layer.msg('新建成功!', {icon:1,time:666},function(){parent.location.reload();});
				        }else{
				        	layer.msg('新建失败!', {icon:2,time:666},function(){location.reload();});
				        }
			 });
	    return false;
	  });
	  
	});
</script>
</html>