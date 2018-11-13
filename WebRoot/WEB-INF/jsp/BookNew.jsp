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
<form class="layui-form" id="addBook" >
 <div class="layui-form-item">
 	 <div class="layui-inline">
	    <label class="layui-form-label">书名</label>
	    <div class="layui-input-inline">
	      <input type="text" name="bookname" required  lay-verify="required" placeholder="请输入书名" autocomplete="off" class="layui-input">
	    </div>
	    <label class="layui-form-label">作者</label>
	    <div class="layui-input-inline">
	      <input type="text" name="bookauthor" required  lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
	    </div>
	</div>
	 <label class="layui-form-label">分类</label>
    <div class="layui-input-inline">
      <select name="bookclass" lay-verify="required">
        <option value=""></option>
       	<c:forEach items="${You}" var="y">
       		 <option>${y.bookclass }</option>
       	</c:forEach>
      </select>
    </div>
	 <label class="layui-form-label">出版时间</label>
    <div class="layui-input-inline">
      <input type="text" name="bookdate"id="date" required  lay-verify="required" placeholder="选择出版时间" autocomplete="off" class="layui-input">
    </div>
 </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">出版社</label>
    <div class="layui-input-block" style="width: 500px">
      <input type="text" name="bookpress" required  lay-verify="required" placeholder="输入出版社" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo" style="margin-left: 180px;">创建</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
 </div>
</body>
<script type="text/javascript" src="<%=basePath %>/js/layui/layui.js"></script>
<script type="text/javascript">

layui.use(['form','layer','laydate'], function(){
	  var form = layui.form,laydate=layui.laydate;
	 	 layer=layui.layer;
	 	laydate.render({
	 	    elem: '#date' //指定元素
	 	    
	 	  });
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    
		$.post("<%=basePath%>/createBook.action",
				$("#addBook").serialize(),
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
function showTime(){
    nowtime=new Date();
    year=nowtime.getFullYear();
    month=nowtime.getMonth()+1;
    date=nowtime.getDate();
    document.getElementById("mytime").innerText=year+"年"+month+"月"+date+" "+nowtime.toLocaleTimeString();
}

setInterval("showTime()",1000);
</script>
</html>