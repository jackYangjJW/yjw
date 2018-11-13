<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="<%=basePath %>js/layui/css/layui.css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=basePath %>/js/layui/layui.js"></script>
      <script type="text/javascript" src="<%=basePath %>/js/jquery-3.3.1.min.js"></script>
  
    <style type="text/css">
    #editR{
		display: none;
	}
	#createR{
			display: none;
	
	}
	#layui-form-item {margin-bottom: 0px;}
        #layui-inline{margin-bottom: 0px;}
    </style>
</head>
<body class="layui-bg-gray" >
<div class="layui-anim layui-anim-fadein">
<h1 style="margin:20px 0 0 25px; color: #009688;">借阅信息</h1>
	<div class="layui-container">  
	 	<div class="layui-row">
	 		<div class="layui-col-md12">
	 	
	 	
	    	</div>
	   	</div>
	   	<!-- 表格 -->
	   	<div class="layui-row">
	   	<hr>
	   		 <div class="layui-col-md12">
	   			<form action="<%=basePath%>/searchBorrow.action" method="get">
	 		<div class="layui-form-item" id="layui-form-item">
	  			<div class="layui-inline" id="layui-inline">
	  			 	<div class="layui-input-inline">
	  			 	<a href="#" class="layui-btn layui-btn-mg layui-btn-green" id="create" style="text-align:left ; margin: 0 auto;">
			   		 	<i class="layui-icon" >&#xe608;</i>添加
			   		 </a>
		   			 </div>
		  			 <div class="layui-input-inline">
		     			 <input type="text" name="readername" placeholder="搜索读者姓名" autocomplete="off" class="layui-input">
		   			 </div>
		   			 <div class="layui-form-mid">-</div>
		   			 <div class="layui-input-inline">
		      			<input type="text" name="bookname" placeholder="输入书籍名" autocomplete="off" class="layui-input">
		    		</div>
	    			<button class="layui-btn layui-btn-green" type="submit">搜索</button>
	 	 		</div>
			</div>
	 		</form>
	      	<table class="layui-table" style="margin-top: 0px;">
			  <colgroup>
	    		<col width="80">
	    		<col width="80">
	    		<col width="100">
	    		<col width="120">
	    		<col width="120">
			    <col width="100">
			  </colgroup>
			  <thead>
			<tr>			
				<th style="text-align: center;">借阅号</th>											
				<th style="text-align: center;">读者</th>															
				<th style="text-align: center;">书籍</th>
				<th style="text-align: center;">借阅时间</th>
				<th style="text-align: center;">借阅天数</th>
				<th style="text-align: center;">操作</th>
			</tr>
		  </thead>
		  <tbody  style="text-align: center;margin: 0 auto;">
		    <c:forEach items="${Borrow}" var="b">
			<tr>
				<td>${b.borrowid}</td>
				<td>${b.readername}</td>									
				<td>${b.bookname}</td>
				<td>${b.borrowdate}</td>
				<td>${b.borrowts}</td>
				<td>
					<a href="#" class="layui-btn layui-btn-xs layui-btn-warm" onclick= "editBorrow(${b.borrowid})">
					<i class="layui-icon" >&#xe642;</i>修改</a>&nbsp;&nbsp;
					<a href="#"  class="layui-btn layui-btn-xs layui-btn-danger"  onclick="deleteBorrow(${b.borrowid})" >
					<i class="layui-icon" >&#xe640;</i> 删除</a>
				</td>
			</tr>
			</c:forEach>
		  </tbody>
		</table>
	  		 </div>
	  	 </div>
	  	 <!-- 分页 -->
	  	 	<div class="layui-row">
	   		 <div class="layui-col-md12" style="text-align: center;">
	      		<div class="layui-btn-group">
			  		<a href="<%=basePath %>/toBorrow.action?start=0" class="layui-btn layui-btn-sm layui-btn-primary">首页</a>
			  		<a href="<%=basePath %>/toBorrow.action?start=${page.start+page.count>0?0:(page.start-page.count)}" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon">&#xe65a;</i></a>
			  		<a href="<%=basePath %>/toBorrow.action?start=${page.start+page.count>page.last?page.last:(page.start+page.count)}" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon">&#xe65b;</i></a>
			  		<a href="<%=basePath %>/toBorrow.action?start=${page.last}" class="layui-btn layui-btn-sm layui-btn-primary" >末页</a>
				</div>
	  		 </div>
	  		 </div>
	</div>
</div>

<!--修改表 -->
<div id="editR">
<form class="layui-form" id="edit_Borrow_form">
    <div class="layui-form-item">
        <label class="layui-form-label">借阅号</label>
        <div class="layui-input-inline">
            <input type="text" id="borrowid"  name="borrowid" placeholder="" autocomplete="off" class="layui-input" readonly="readonly">
        </div>
        <div class="layui-form-mid layui-word-aux">*不可更改</div>
    </div>
	<div class="layui-form-item">
	    <label class="layui-form-label">读者</label>
	    <div class="layui-input-block">
	      <select name="readername" id="readername" lay-verify="required">
	        <option value="" id="readername">${data.readername }</option>
	      	<c:forEach items="${Reader}" var="r">
	        	<option>${r.name }</option>
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
		    <label class="layui-form-label">书名</label>
		    <div class="layui-input-block">
		      <select name="bookname" id="bookname" lay-verify="required">
		        <option value="" id="bookname"></option>
		       	<c:forEach items="${Book}" var="b">
		       		 <option>${b.bookname }</option>
		       	</c:forEach>
		      </select>
		    </div>
		  </div>

		  <div class="layui-form-item">
	        <label class="layui-form-label">借阅时间</label>
	        <div class="layui-input-inline">
	            <input type="text" id="borrowdate"  name="borrowdate" placeholder="" autocomplete="off" class="layui-input" readonly="readonly">
	        </div>
	          <div class="layui-form-mid layui-word-aux">*不可更改</div>
	      </div>
	    <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
	    </div>
	  </div>
</form>
</div>

<script>

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
	    
		$.post("<%=basePath%>/updateBorrow",
				$("#edit_Borrow_form").serialize(),
						function(data){
				        if(data =="OK"){
				        	layer.msg('新建成功!', {icon:1,time:666},function(){location.reload();});
				        }else{
				        	layer.msg('新建失败!', {icon:2,time:666},function(){location.reload();});
				        }
			 });
	    return false;
	  });
	});
layui.use('table', function(){
  var table = layui.table;
});
//清空新建客户窗口中的数据
 //创建弹出表单
    $('#create').on('click', function(){
    	layui.use('layer', function(){
    	 var layer = layui.layer;
       		 layer.open({
       			  title:'新建借阅信息',
		          type: 2,
		          id:'adde',
   		          area: ['70%', '99%'],
   		     	  offset: 'auto',
   		     	  maxmin: true,
		         // shadeClose: true, //点击遮罩关闭
		          content: '<%=basePath %>/BorrowNew.action'
		
        });
      
      });
    });
// 创建客户
function createReader() {
	layer.ready(function () {
	$.post("<%=basePath%>/createReader.action",
	$("#addReader").serialize(),
		function(data){
        if(data =="OK"){
        	layer.msg('新建成功!', {icon:1,time:666},function(){location.reload();});
        }else{
        	layer.msg('新建失败!', {icon:2});
        }
    });
	});
}
// 通过id获取修改的信息
function editBorrow(id) {
    $.ajax({
        type:"get",
        url:"<%=basePath%>/getBorrowByID",
        data:{"id":id},
        success:function(data) {
            $("#borrowid").val(data.borrowid);
            $("#readername").val(data.readername);
            $("#bookname").val(data.bookname)
            $("#borrowts").val(data.borrowts)
            $("#borrowdate").val(data.borrowdate)
            layui.use('layer', function(){
           	 var layer = layui.layer;
              		 layer.open({
              			title:"修改借阅",
              			id:'adddd',
       		          type: 1,
       		          area: ['70%', '90%'],
       		     	  offset: 'auto',
       		          shadeClose: true, //点击遮罩关闭
       		          content: $('#editR'),
               });
             });
        }
    });
}
// 删除客户
function deleteBorrow(id) {
	 layer.confirm('确定删除该信息？',function(){
		 $.post("<%=basePath%>/delectBorrow.action",{"id":id},
				 function(data){
	            if(data =="OK"){
	            	 layer.msg('删除成功!',{icon:1,time:666},function(){location.reload();});
	            	 
	            }else{
	            	 layer.msg('删除失败!',{icon:2,time:666},function(){location.reload();});  
	          	}
	    
	        });	
     });
}

  function sss(){
        var name = $("#name").val();
        if(name==""){
            $("#message").text("请输入你要搜索的读者！");
            return false;
        }
        return true;
    }

</script>
</body>
</html>