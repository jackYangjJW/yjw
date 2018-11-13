<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    top: 63px;
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
#readerid,#dp{
	border-bottom: 0px;
	border-right: 0px;
	border-top: 0px;
}
body .demo-class .layui-layer-title{background:#009688; color:#fff; border: none;}
	</style>
</head>
<body class="layui-bg-gray">
<div>
<ul class="layui-nav layui-bg-green" >
 <li class="layui-nav-item">
    <a href="javascript:;"><img src="<%=basePath %>/images/pig.png" class="layui-nav-img">${Reader.name }</a>
    <dl class="layui-nav-child"> <!-- 二级菜单 -->
      <!--<dd onclick="editReader(${Reader.readerid})"><a href="#">个人信息</a></dd>-->
      <dd id="edit"><a href="#">修改密码</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="<%=basePath %>/tologin2.action">退出</a>
  </li>
</ul>
</div>
<div class="layui-tab layui-tab-brief" lay-filter="test" style=" width:100%;hwidth: 100%">
  <ul class="layui-tab-title">
    <li style="width: 31%" lay-id="1"  class="layui-this">个人信息</li>
    <li style="width: 31%" lay-id="2">借阅信息</li>
    <li style="width: 31%" lay-id="3">书籍信息</li>
  </ul>
  <div class="layui-tab-content">
  <!-- 用户个人信息 -->
    <div class="layui-tab-item layui-anim layui-anim-fadein  layui-show" style="height: 570px;border-top: 12px;" >
		 <form class="layui-form layui-form-pane" id="addReader" action="" >
		   <div class="layui-form-item">
		    <label class="layui-form-label">账号/ID</label>
		    <div class="layui-input-inline">
		      <input type="text" name="readerid" id="readerid" value="${Reader.readerid }" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" readonly>
		    </div>
		    <div class="layui-form-mid layui-word-aux">*不可修改*</div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">姓名</label>
		    <div class="layui-input-block">
		      <input type="text" name="name" id="name" value="${Reader.name }"required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">电话</label>
		    <div class="layui-input-block">
		      <input type="text" name="phone" id="phone" value="${Reader.phone }" required lay-verify="phone" placeholder="请输入密码" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">性别</label>
		    <div class="layui-input-block">
		      <select name="sex" lay-verify="required">
		        <option value="${Reader.sex }">${Reader.sex }</option>
		        <option value="男">男</option>
		        <option value="女">女</option>
		
		      </select>
		    </div>
		  </div>
		
		   <div class="layui-form-item">
		    <label class="layui-form-label">院系</label>
		    <div class="layui-input-inline">
		      <input type="text" name="dp" id="dp" value="${Reader.dp }" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" readonly>
		    </div>
		    <div class="layui-form-mid layui-word-aux">*不可修改*</div>
		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn layui-btn-primary" lay-submit lay-filter="formDemo">修改</button>
		    </div>
		  </div>
		</form>
    </div>
 
  	<div class="layui-tab-item layui-anim layui-anim-fadein" style="height: 560px">
	  		<table class="layui-table" lay-skin="row">
  				  <colgroup>
				    <col width="150">
				    <col width="200">
				    <col>
				    <col>
				    <col>
				  </colgroup>
				  <thead>
				    <tr>
				      <th>借阅号</th>
				      <th>借阅书籍</th>
				      <th>借阅时间</th>
				      <th>借阅期限</th>
				      <th>操作</th>
				    </tr> 
				  </thead>
				  <tbody>
				   <c:forEach items="${Borrow }" var="b">
				    <tr>
				      <td>${b.borrowid }</td>
				      <td>${b.bookname }</td>
				      <td>${b.borrowdate }</td>
				      <td>${b.borrowts }</td>
				      <td>
				      	<a href="#" class="layui-btn layui-btn-xs layui-btn-danger"  onclick= "deleteBorrow(${b.borrowid})">
                                    <i class="layui-icon" >&#xe705;</i>还书</a>
				      </td>
				    </tr>
				    </c:forEach>				   
				  </tbody>
			</table>
    </div>
    <div class="layui-tab-item layui-anim layui-anim-fadein" style="height: 570px">
    	<iframe  scrolling="auto" frameborder="0" src="<%=basePath %>/ReaderBook" width="100%" height="570px"></iframe>
    </div>
  </div>
 <div class="layui-footer" style="">
      <p style="text-align: center;"> Copyright© 2018.10-2019.12 <a href="<%=basePath %>/yangjingwen">杨景文</a>&nbsp;毕业设计 </p>
    </div>
</div> 
<!--<div id="infoR" style="display:none;">
<form class="layui-form layui-form-pane" id="addReader" action="">
   <div class="layui-form-item">
    <label class="layui-form-label">账号/ID</label>
    <div class="layui-input-block">
      <input type="text" name="readerid" id="readerid" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" readonly>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="name" id="name" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">电话</label>
    <div class="layui-input-block">
      <input type="text" name="phone" id="phone" required lay-verify="phone" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block" style="margin-left: 120px">
  	 <p class="layui-form-mid layui-word-aux" name="sex" id="sex"></p>
  </div>
  </div>

  <div class="layui-form-item">
  	<label class="layui-form-label">院系</label>
   	 <div class="layui-input-block" style="margin-left: 120px">
    	 <p class="layui-form-mid layui-word-aux" id="dp"></p>
   	 </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn layui-btn-primary" lay-submit lay-filter="formDemo">修改</button>
     
    </div>
  </div>
</form>
</div>-->
<!-- 改密 -->
<div id="editPwd" style="display: none;">
<form class="layui-form layui-form-pane" id="editpassword" action=""style="margin-top: 20px;">
	<div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="text" name="readerid" value="${Reader.readerid }" autocomplete="off" class="layui-input" style="display: none;">
      <input type="text" name="password" id="phone"required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
    <button class="layui-btn" lay-submit lay-filter="formDemo1">修改</button>
  </div>
</form>

</div>
</body>

<script type="text/javascript">
layui.use(['element','form','layer','jquery'], function(){
	  var element = layui.element,
	  form=layui.form,
	  layer = layui.layer
	  $=layui.jquery;
	  //监听提交
	  form.on('submit(formDemo)', function(data){
		$.post("<%=basePath%>/updateReader.action",
				$("#addReader").serialize(),
						function(data){
				        if(data =="OK"){
				        	layer.msg('修改成功!', {icon:1,time:666},function(){location.reload();});
				        }else{
				        	layer.msg('修改失败!', {icon:2,time:666},function(){location.reload();});
				        }
			 });
	    return false;
	  });
	//监听提交
	  form.on('submit(formDemo1)', function(data){
		  layer.confirm('修改密码需要重新登录!',function(){
		$.post("<%=basePath%>/updateReader.action",
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
	  var layid = location.hash.replace(/^#test=/, '');
	  element.tabChange('test', layid);
	  
	  element.on('tab(test)', function(elem){
	    location.hash = 'test='+ $(this).attr('lay-id');
	  });
	//修改密码
		$('#edit').on('click', function(){
			layui.use('layer', function(){
			 var layer = layui.layer;
		   		 layer.open({
		   			 title:"修改密码",
			          type: 1,
			          area: ['400px','120px'],
			          closeBtn: 0,//不显示X
			          shadeClose: true, //点击遮罩关闭
			          content: $('#editPwd')
		    });
		  });
		});
		
});
$('#ReaderI').on('click', function(){
	layui.use('layer', function(){
	 var layer = layui.layer;
	 
   		 layer.open({
   		 	 skin: 'demo-class',
   			 title:"读者信息",
	          type: 1,
	          area: ['90%','100px'],
	      
	          shadeClose: true, //点击遮罩关闭
	          content: $('#Reader')
    });
  });
});
//修改密码
//个人信息
 function editReader(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/getReaderById.action",
            data:{"id":id},
            success:function(data) {
                $("#readerid").val(data.readerid);
                $("#name").val(data.name);
                $("#sex").text(data.sex)
                $("#phone").val(data.phone)
                $("#dp").text(data.dp)
                $("#zc").val(data.zcdate);
                layui.use('layer', function(){
               	 var layer = layui.layer;
                  		 layer.open({
                  			skin: 'demo-class',
                  			 title:"${Reader.name}的个人信息",
               	          type: 1,//弹出类型
               	          area: ['300px','370px'],
               	          closeBtn: 0,//不显示X
               	          shade: 0.1,//关闭遮罩
               	          anim: 1,//弹出动画
               	      	  offset: ['111px',''],//左上
               	         // move: false,//关闭拖拽
               	         // fixed: false,//固定
               	         // scrollbar: false,//关闭滚动
               	         // isOutAnim: false,//关闭动画
               	          shadeClose: true, //点击遮罩关闭
               	          content: $('#infoR')
                   });
                 });
            }
        });
    }
 function deleteBorrow(id) {
	 layer.confirm('确定归还该图书？',function(){
		 $.post("<%=basePath%>/delectBorrow.action",{"id":id},
				 function(data){
	            if(data =="OK"){
	            	 layer.msg('归还成功!',{icon:1,time:666},function(){location.reload();});
	            	 
	            }else{
	            	 layer.msg('归还失败!',{icon:2,time:666},function(){location.reload();});  
	          	}
	    
	        });	
     });
}
</script>
</html>