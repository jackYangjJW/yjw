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
        #editR{display: none; }
        #createR{display: none;}
        #layui-form-item {margin-bottom: 0px;}
        #layui-inline{margin-bottom: 0px;}
    </style>
</head>
<body class="layui-bg-gray" >
<div class="layui-anim layui-anim-fadein">
    <h1 style="margin:20px 0 0 25px; color: #009688;">读者信息</h1>
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md12">

            </div>
        </div>
        <!-- 表格 -->
        <div class="layui-row">
            <div class="layui-col-md12">
                <hr> 
				   <form action="<%=basePath%>/searchName.action" method="get">
                    <div class="layui-form-item" id="layui-form-item">
                        <div class="layui-inline" id="layui-inline">
                            <div class="layui-input-inline" >
	                            <a href="#" class="layui-btn layui-btn-mg layui-btn-green" id="create" style="text-align:left ; margin: 0 auto;"> 
									<i class="layui-icon" >&#xe608;</i>添加               
							 	</a>
                            </div>
                             <div class="layui-input-inline" style="text-align: right;">
                                <input type="text" name="name" lay-verify="phone"   placeholder="搜索读者姓名" autocomplete="off" class="layui-input">
                            </div>
                            <button class="layui-btn layui-btn-green" style="text-align: right;" lay-submit lay-filter="formDemo"> <i class="layui-icon" >&#xe615;</i></button>
                        </div>
                    </div>
                </form>
            	<div class="layui-form">
                <table class="layui-table" style="margin-top: 0px;">
                    <colgroup>
                    	<col width="50">
                        <col>
                        <col width="100">
                        <col width="100">
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                    	<th>
							<input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose">
							</th>
                        <th style="text-align: center;">编号</th>
                        <th style="text-align: center;">姓名</th>
                        <th style="text-align: center;">性别</th>
                        <th style="text-align: center;">手机</th>
                        <th style="text-align: center;">院系</th>
                        <th style="text-align: center;">创建时间</th>
                        <th style="text-align: center;">操作</th>

                    </tr>
                    </thead>
                    <tbody  style="text-align: center;margin: 0 auto;">
                    <c:forEach items="${Reader}" var="r">
                        <tr>
                        	<td>
                        	<input type="checkbox" name="" lay-skin="primary"  data-id="1">
   							</td>
                            <td>${r.readerid}</td>
                            <td>${r.name}</td>
                            <td>${r.sex}</td>
                            <td>${r.phone}</td>
                            <td>${r.dp}</td>
                            <td>${r.zcdate}</td>
                            <td>
                           		 <a href="#" class="layui-btn layui-btn-xs" onclick= "editRj('${r.name}')">
                                    <i class="layui-icon" >&#xe60a;</i>查看借阅</a>&nbsp;
                                <a href="#" class="layui-btn layui-btn-xs layui-btn-warm"  onclick= "editReader(${r.readerid})">
                                    <i class="layui-icon" >&#xe642;</i>修改</a>&nbsp;
                                <a href="#" class="layui-btn layui-btn-xs layui-btn-warm"  onclick= "editPwd(${r.readerid})">
                                    <i class="layui-icon" >&#xe642;</i>修改密码</a>&nbsp;
                                <a href="#"  class="layui-btn layui-btn-xs layui-btn-danger"  onclick="deleteReader(${r.readerid})" >
                                    <i class="layui-icon" >&#xe640;</i> 删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
        <!-- 分页 -->
        <div class="layui-row">
            <div class="layui-col-md12" style="text-align: center;">
                <div class="layui-btn-group">
                    <a href="<%=basePath %>/toReader.action?start=0" class="layui-btn layui-btn-sm layui-btn-primary">首页</a>
                    <a href="<%=basePath %>/toReader.action?start=${page.start+page.count>0?0:(page.start-page.count)}" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon">&#xe65a;</i></a>
                    <a href="<%=basePath %>/toReader.action?start=${page.start+page.count>page.last?page.last:(page.start+page.count)}" class="layui-btn layui-btn-sm layui-btn-primary"><i class="layui-icon">&#xe65b;</i></a>
                    <a href="<%=basePath %>/toReader.action?start=${page.last}" class="layui-btn layui-btn-sm layui-btn-primary" >末页</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 修改密码 -->
<div id="editP" style="display: none;">
	<form class="layui-form layui-form-pane" id="editpassword" action=""style="margin-top: 20px;">
	<div class="layui-form-item">
    <label class="layui-form-label">原密码</label>
    <div class="layui-input-inline" style="border:0 0 0 1px;">
      <input type="text" name="readerid" id="readerid" autocomplete="off" class="layui-input" style="display: none;">
      <input type="text" id="password" required lay-verify="required"  autocomplete="off" class="layui-input" readonly="readonly">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input type="text" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
    <button class="layui-btn" lay-submit lay-filter="formDemo12">修改</button>
  </div>
</form>
</div>
<!--修改表 -->
<div id="editR">
	<div style="margin-top:20px; ">
    <form class="layui-form" id="edit_Reader_form">
        <div class="layui-form-item">
            <label class="layui-form-label">读者编号</label>
            <div class="layui-input-inline">
                <input type="text" id="_readerid"  name="readerid" placeholder="" autocomplete="off" class="layui-input" readonly="readonly">
            </div>
            <div class="layui-form-mid layui-word-aux">*不可更改</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">读者姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="_name" name="name"   placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">院系</label>
            <div class="layui-input-inline">
                <select name="dp" >
                    <option value=""></option>
                   <c:forEach items="${You}" var="y">
       		 			<option>${y.readerdp }</option>
       				</c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机</label>
            <div class="layui-input-inline">
                <input type="text" id="_phone" lay-verify="phone"  name="phone" placeholder="${User.phone }" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item"pane>
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" id="_sex" name="sex" value="男" title="男" checked>
                <input type="radio" id="_sex" name="sex" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">创建时间</label>
            <div class="layui-input-inline">
                <input type="text" id="_zc"  name="zcdate" placeholder="" autocomplete="off" class="layui-input" readonly="readonly">
            </div>
            <div class="layui-form-mid layui-word-aux">*不可更改</div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn"  lay-submit lay-filter="formDemo" onclick="updateReader()">修改</button>
            </div>
        </div>
    </form>
    </div>
</div>
<!-- 查看借阅 -->
<div id="editRj" style="display: none;">
	<form class="layui-form layui-form-pane" style="margin-top: 15px">
   <div class="layui-form-item">
    <label class="layui-form-label">借阅号</label>
    <div class="layui-input-block">
      <input type="text" name="borrowid" id="borrowid" placeholder="无借阅信息" autocomplete="off" class="layui-input" readonly>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">借阅者</label>
    <div class="layui-input-block">
      <input type="text" name="readername" id="readername" placeholder="无借阅信息" autocomplete="off" class="layui-input" readonly>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">书籍名</label>
    <div class="layui-input-block">
      <input type="text" name="bookname" id="bookname" placeholder="无借阅信息" autocomplete="off" class="layui-input" readonly>
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">借阅时间</label>
    <div class="layui-input-block">
      <input type="text" name="borrowdate" id="borrowdate" placeholder="无借阅信息" autocomplete="off" class="layui-input" readonly>
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">借阅天数</label>
    <div class="layui-input-block">
      <input type="text" name="borrowts" id="borrowts" placeholder="无借阅信息" autocomplete="off" class="layui-input" readonly>
    </div>
  </div>
</form>
</div>
<script>

    layui.use(['form','layer'], function(){
        var form = layui.form,layer=layui.layer;
      //监听提交
  	  form.on('submit(formDemo12)', function(data){
  		$.post("<%=basePath%>/updateReader.action",
  				$("#editpassword").serialize(),
  						function(data){
  				        if(data =="OK"){
  				        	layer.msg('修改成功!', {icon:1,time:666},function(){location.reload();});
  				        }else{
  				        	layer.msg('修改失败!', {icon:2,time:666},function(){location.reload();});
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
                title:'新建读者',
                type: 2,
                id:'adde',
                area: ['70%', '85%'],
                offset: 'auto',
                maxmin: true,
                // shadeClose: true, //点击遮罩关闭
                content: '<%=basePath %>/ReaderNew.action'

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
    //查看借阅
    function editRj(name) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/getReaderByName.action",
            data:{"name":name},
            success:function(data) {
                $("#borrowid").val(data.borrowid);
                $("#readername").val(data.readername);
                $("#bookname").val(data.bookname)
                $("#borrowdate").val(data.borrowdate)
                $("#borrowts").val(data.borrowts)
                $("#_zc").val(data.zcdate);
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.open({
                        title:"查看借阅",
                        id:'addd',
                        type: 1,
                        area: ['550px', '330px'],
                        offset: 'auto',
                        shadeClose: true, //点击遮罩关闭
                        content: $("#editRj"),
                    });
                });
            }
        });
    }
    //修改密码
    function editPwd(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/getReaderById.action",
            data:{"id":id},
            success:function(data) {
                $("#readerid").val(data.readerid);
                $("#password").val(data.password);
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.open({
                        title:"修改读者密码",
                        id:'pwd',
                        type: 1,
                        area: ['380px', '175px'],
                        offset: 'auto',
                        shadeClose: true, //点击遮罩关闭
                        content: $("#editP"),
                    });
                });
            }
        });
    }
    // 通过id获取修改的客户信息
    function editReader(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/getReaderById.action",
            data:{"id":id},
            success:function(data) {
                $("#_readerid").val(data.readerid);
                $("#_name").val(data.name);
                $("#_sex").val(data.sex)
                $("#_phone").val(data.phone)
                $("#_dp").val(data.dp)
                $("#_zc").val(data.zcdate);
                layui.use('layer', function(){
                    var layer = layui.layer;
                    layer.open({
                        title:"修改",
                        id:'add',
                        type: 1,
                        area: ['400px', '450px'],
                        offset: 'auto',
                        shadeClose: true, //点击遮罩关闭
                        content: $("#editR"),
                    });
                });
            }
        });
    }
    // 执行修改客户操作
    function updateReader() {
        layer.ready(function () {
            $.post("<%=basePath%>/updateReader.action",
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
    function deleteReader(id) {
        layer.confirm('确定删除该读者，同时他的借阅信息也将删除！',{icon:3}
          ,function(){
            $.post("<%=basePath%>/deleteReader.action",{"id":id},
                function(data){
                    if(data =="OK"){
                        layer.msg('删除成功!',{icon:1,time:666},function(){location.reload();});

                    }else{
                        layer.msg('删除失败!',{icon:2,time:666},function(){location.reload();});
                    }

                });
        });
    }

</script>
</body>
</html>