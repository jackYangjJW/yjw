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

        #layui-inline{margin-bottom: 0px;}
    </style>
</head>
<body class="layui-bg-gray" >
<div class="layui-anim layui-anim-fadein">

        <div class="layui-row">
            <div class="layui-col-md12">

            </div>
        </div>
        <!-- 表格 -->
        <div class="layui-row">
            <div class="layui-col-md12">
                <hr>
 				  <form class="layui-form" action="<%=basePath%>/Rsearch.action" method="get"  onsubmit="return sss()">
                   <div class="layui-form-item" id="layui-form-item">
  						<div class="layui-inline" id="layui-inline">
  						<div class="layui-form-mid" style="color: #393D49">书籍搜索</div>
   							 <div class="layui-input-inline">
     							 <input type="text" name="bookname" placeholder="搜索书名" autocomplete="off" class="layui-input">
   							 </div>
    						<div class="layui-form-mid">-</div>
    						<div class="layui-input-inline" >
								    <select name="bookclass">
							        	<option value=""></option>
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
                        <th style="text-align: center;">书名</th>
                        <th style="text-align: center;">作者</th>
                        <th style="text-align: center;">分类</th>
                        <th style="text-align: center;">出版社</th>
                        <th style="text-align: center;">出版日期</th>
                        <th style="text-align: center;">操作</th>
                    </tr>
                    </thead>
                    <tbody  style="text-align: center;margin: 0 auto;">
                    <c:forEach items="${Book}" var="b">
                        <tr>
                            <td>${b.bookname}</td>
                            <td>${b.bookauthor}</td>
                            <td>${b.bookclass}</td>
                            <td>${b.bookpress}</td>
                            <td>${b.bookdate}</td>
                            <td>
                                <a href="#" class="layui-btn layui-btn-norma layui-btn-xs " style="background-color: #01AAED" id="edit" onclick= "editBook(${b.bookid})">
                                    <i class="layui-icon" >&#xe61f;</i>借阅</a>&nbsp;&nbsp;

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
                    <a href="<%=basePath %>/ReaderBook?start=0" class="layui-btn layui-btn-sm layui-btn-primary">首页</a>
                    <a href="<%=basePath %>/ReaderBook?start=${page.start+page.count>0?0:(page.start-page.count)}" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon">&#xe65a;</i></a>
                    <a href="<%=basePath %>/ReaderBook?start=${page.start+page.count>page.last?page.last:(page.start+page.count)}" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon">&#xe65b;</i></a>
                    <a href="<%=basePath %>/ReaderBook?start=${page.last}" class="layui-btn layui-btn-sm layui-btn-primary" >末页</a>
                </div>
            </div>
        </div>
    </div>


<!--修改表 -->
<div id="addBorrowDiv" style="display: none;">
	<div class="layui-container ">
	<form class="layui-form" id="addB" style="margin-top: 15px" >
	 		<div class="layui-form-item">
			    <label class="layui-form-label">读者</label>
			    <div class="layui-input-block">
			    <input type="text" name="readerid" value="${Reader.readerid }"  autocomplete="off" style="display:none;">
			      <input type="text" name="readername" value="${Reader.name }" required  lay-verify="required"  autocomplete="off" class="layui-input" readonly="readonly">
		    	</div>
		    </div>
			<div class="layui-form-item">
			    <label class="layui-form-label">书籍名</label>
			    <div class="layui-input-block">
			      <input type="text" name="bookname" id="bookname" required  lay-verify="required" placeholder="请输入书名" autocomplete="off" class="layui-input" readonly>
			    </div>
			 </div>
			<div class="layui-form-item">
			    <label class="layui-form-label">借阅时间段</label>
			    <div class="layui-input-block" >
			        <input type="text" id="test16" name="borrowts" required lay-verify="required"  placeholder="选择借阅时间" autocomplete="off" class="layui-input">
			   </div>
			  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn layui-btn-warm" lay-submit lay-filter="addBorrow" >借阅</button>
		    </div>
		  </div>
	</form>
</div>
</div>
    <script type="text/javascript" src="<%=basePath %>/js/jquery-3.3.1.min.js"></script>
<script>
    layui.use(['form','layer','laydate','table'], function(){
    	 var form = layui.form,laydate=layui.laydate;
	 	var layer=layui.layer;
	 	var table = layui.table;
	 	 laydate.render({
			    elem: '#test16'
			    ,range: '到'
			    ,min:0
			    ,max:60
			    ,format: 'yyyy-M-d'
			  });
	 	  //监听提交
		  form.on('submit(addBorrow)', function(data){
			$.post("<%=basePath %>/createBorrow",
					$("#addB").serialize(),
							function(data){
					        if(data =="OK"){
					        	layer.msg('借阅成功!', {icon:1,time:666},function(){parent.location.reload();});
					        }else{
					        	layer.msg('借阅失败!', {icon:2,time:666},function(){location.reload();});
					        }
				 });
		    return false;
		  });

    });
    // 通过id获取添加
    function editBook(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/getBookById.action",
            data:{"id":id},
            success:function(data) {
                $("#bookname").val(data.bookname);
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.open({
                        title:"借阅书籍",
                        id:'editBook',
                        type: 1,
                        area: ['100%', '100%'],
                        offset: 'auto',
                        shadeClose: true, //点击遮罩关闭
                        content: $('#addBorrowDiv')
                    });
                });
            }
        });
    }
    function addBorrowReader() {
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