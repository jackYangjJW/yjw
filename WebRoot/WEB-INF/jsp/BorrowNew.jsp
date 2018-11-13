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
<div class="layui-container " style="margin-top:60px ">
<form class="layui-form" id="addBorrow" >
  <div class="layui-form-item">
    <label class="layui-form-label">读者</label>
    <div class="layui-input-block">
      <select name="readername" lay-verify="required">
        <option value=""></option>
      	<c:forEach items="${Reader}" var="r">
        	<option>${r.name }</option>
        </c:forEach>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">书名</label>
    <div class="layui-input-block">
      <select name="bookname" lay-verify="required">
        <option value=""></option>
       	<c:forEach items="${Book}" var="b">
       		 <option>${b.bookname }</option>
       	</c:forEach>
      </select>
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">天数</label>
    <div class="layui-input-block">
        <input type="text" id="test16" name="borrowts"   placeholder="选择借阅时间" autocomplete="off" class="layui-input">
   </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">创建</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</div>
</body>
<script type="text/javascript" src="<%=basePath %>/js/layui/layui.js"></script>
<script type="text/javascript">

layui.use(['form','layer','laydate'], function(){
	  var form = layui.form,layer=layui.layer;
	  var laydate = layui.laydate;

	  laydate.render({
		    elem: '#test16'
		    ,range: '到'
		    ,min:0
		    ,max:60
		    ,format: 'yyyy-M-d'
		  });
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    
		$.post("<%=basePath%>/createBorrow",
				$("#addBorrow").serialize(),
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