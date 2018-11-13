<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
//路径
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
        #editR{display: none;}
        #createR{display: none;}
         #layui-form-item {margin-bottom: 0px;}
        #layui-inline{margin-bottom: 0px;}
    </style>
</head>
<body class="layui-bg-gray" >
<div class="layui-anim layui-anim-fadein">
    <h1 style="margin:20px 0 0 25px; color: #009688;">书籍信息</h1>
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md12">

            </div>
        </div>
        <!-- 表格 -->
        <div class="layui-row">
            <div class="layui-col-md12">
                <hr>
 				  <form class="layui-form" action="<%=basePath%>/search.action" method="get"  onsubmit="return sss()">
                   <div class="layui-form-item" id="layui-form-item">
  						<div class="layui-inline" id="layui-inline">
  							<div class="layui-input-inline">
  								<a href="#" class="layui-btn layui-btn-mg layui-btn-green" id="create" style="text-align:left ; margin: 0 auto;"> 
				                	<i class="layui-icon" >&#xe608;</i>添加
				                </a>  
   							 </div>
   							 <div class="layui-input-inline">
     							 <input type="text" name="bookname" placeholder="搜索书名" autocomplete="off" class="layui-input">
   							 </div>
    						<div class="layui-form-mid">-</div>
    						<div class="layui-input-inline" >
								  <select name="bookclass" lay-verify="required">
							        	<option value="">分类</option>
							       	<c:forEach items="${You}" var="y">
							       		 <option>${y.bookclass }</option>
							       	</c:forEach>
							      </select>
   							 </div>
   							  <button class="layui-btn layui-btn-green"> <i class="layui-icon" >&#xe615;</i></button>
  						<p id="ms"></p>
  						</div>
				</div>           
                </form>
                 <table class="layui-table" style="margin-top: 0px;">                 
                    <thead>
                    <tr>
                        <th style="text-align: center;">书籍号</th>
                        <th style="text-align: center;">书名</th>
                        <th style="text-align: center;">作者</th>
                        <th style="text-align: center;">分类</th>
                        <th style="text-align: center;">出版社</th>
                        <th style="text-align: center;">出版日期</th>
                        <th style="text-align: center;">创建时间</th>
                        <th style="text-align: center;">操作</th>
                    </tr>
                    </thead>
                    <tbody  style="text-align: center;margin: 0 auto;">
                    <c:forEach items="${Book}" var="b">
                        <tr>
                            <td>${b.bookid}</td>
                            <td>${b.bookname}</td>
                            <td>${b.bookauthor}</td>
                            <td>${b.bookclass}</td>
                            <td>${b.bookpress}</td>
                            <td>${b.bookdate}</td>
                            <td>${b.bookzcdate}</td>
                            <td>
                                <a href="#" class="layui-btn layui-btn-xs layui-btn-warm" id="edit" onclick= "editBook(${b.bookid})">
                                    <i class="layui-icon" >&#xe642;</i>修改</a>&nbsp;&nbsp;
                                <a href="#"  class="layui-btn layui-btn-xs layui-btn-danger"  onclick="deleteBook(${b.bookid})" >
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
                    <a href="<%=basePath %>/toBook.action?start=0" class="layui-btn layui-btn-sm layui-btn-primary">首页</a>
                    <a href="<%=basePath %>/toBook.action?start=${page.start+page.count>0?0:(page.start-page.count)}" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon">&#xe65a;</i></a>
                    <a href="<%=basePath %>/toBook.action?start=${page.start+page.count>page.last?page.last:(page.start+page.count)}" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon">&#xe65b;</i></a>
                    <a href="<%=basePath %>/toBook.action?start=${page.last}" class="layui-btn layui-btn-sm layui-btn-primary" >末页</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!--修改表 -->
<div id="editBookDiv" style="display: none;">
	<div class="layui-container ">
	<form class="layui-form" id="editBookb" >
	 	<div class="layui-form-item">
		    <label class="layui-form-label">书籍号</label>
		    <div class="layui-input-inline">
		      <input type="text" name="bookid" id="bookid" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input" readonly>
		    </div>
		     <div class="layui-form-mid layui-word-aux">不可修改</div>
		</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">书籍名</label>
			    <div class="layui-input-block">
			      <input type="text" name="bookname" id="bookname" required  lay-verify="required" placeholder="请输入书名" autocomplete="off" class="layui-input">
			    </div>
			</div>
 			<div class="layui-form-item">
			    <label class="layui-form-label">作者</label>
			    <div class="layui-input-block">
			      <input type="text" name="bookauthor" id="bookauthor" required  lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
		    	</div>
		    </div>
		   <div class="layui-form-item">	
			 <label class="layui-form-label">出版时间</label>
		    <div class="layui-input-block">
		      <input type="text" name="bookdate" id="date" required  lay-verify="required" placeholder="选择出版时间" autocomplete="off" class="layui-input">
		    </div>
		 </div>
		   <div class="layui-form-item">	    	
			 <label class="layui-form-label">分类</label>
		    <div class="layui-input-block">
		      <select name="bookclass" id="bookclass" lay-verify="required">
		        	<option value=""id="bookclass"></option>
		       	<c:forEach items="${You}" var="y">
		       		 <option>${y.bookclass }</option>
		       	</c:forEach>
		      </select>
		    </div>
		 </div>
		<div class="layui-form-item">	    			    
		    <label class="layui-form-label">出版社</label>
		    <div class="layui-input-block" >
		      <input type="text" name="bookpress"  id="bookpress" required  lay-verify="required" placeholder="输入出版社" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">	    			    
		    <label class="layui-form-label">创建时间</label>
		    <div class="layui-input-inline" >
		      <input type="text" name="bookzcdate"  id="bookzcdate" required  lay-verify="required" placeholder="输入出版社" autocomplete="off" class="layui-input" readonly="readonly">
		    </div>
		    <div class="layui-form-mid layui-word-aux">不可修改</div>
		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-submit lay-filter="formDemo" style="margin-left: 180px;">创建</button>
		    </div>
		  </div>
	 
	</form>
</div>
</div>
<script>
    layui.use(['form','layer','laydate','table'], function(){
    	 var form = layui.form,laydate=layui.laydate;
	 	var layer=layui.layer;
	 	var table = layui.table;
	 	laydate.render({
	 	    elem: '#date' //指定元素
	 	  });
	 	  //监听提交
		  form.on('submit(formDemo)', function(data){
			$.post("<%=basePath%>/updateBook.action",
					$("#editBookb").serialize(),
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
    //清空新建客户窗口中的数据
    //创建弹出表单
    $('#create').on('click', function(){
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.open({
                title:'新建书籍信息',
                type: 2,
                id:'adde',
                area: ['60%', '90%'],
                offset: 'auto',
                showBottom: false,

                // shadeClose: true, //点击遮罩关闭
                content: '<%=basePath %>/BookNew.action'

            });

        });
    });
    // 通过id获取修改的客户信息
    function editBook(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/getBookById.action",
            data:{"id":id},
            success:function(data) {
                $("#bookid").val(data.bookid);
                $("#bookname").val(data.bookname);
                $("#bookauthor").val(data.bookauthor)
                $("#bookclass").val(data.bookclass)
                $("#date").val(data.bookdate)
                $("#bookpress").val(data.bookpress);
                $("#bookzcdate").val(data.bookzcdate);
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.open({
                        title:"修改书籍信息",
                        id:'editBook',
                        type: 1,
                        area: ['100%', '100%'],
                        offset: 'auto',
                       
                        shadeClose: true, //点击遮罩关闭
                        content: $('#editBookDiv')
                    });
                });
            }
        });
    }
    // 执行修改客户操作
    function updateBook() {
        layer.ready(function () {
            $.post("<%=basePath%>/updateBook.action",
                $("#edit_Reader_form").serialize(),
                function(data){
                    if(data =="OK"){
                        layer.msg('修改成功!', {icon:1,time:666},function(){location.reload();});

                    }else{
                        layer.msg('修改失败!', {icon:2,time:666},function(){location.reload();});
                    }
                });
        });

    }
    // 删除客户
    function deleteBook(id) {
        layer.confirm('确定删除该信息？',function(){
            $.post("<%=basePath%>/deleteBook.action",{"id":id},
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
            $("#ms").text("请输入你要搜索的书名或者分类！");
            return false;
        }
        return true;
    }

</script>
</body>
</html>