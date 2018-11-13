<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE  HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="<%=basePath %>js/bootstrap-337/css/bootstrap.min.css">
  	<script src="<%=basePath%>js/jquery-3.3.1.min.js"></script>
	<script src="<%=basePath%>js/layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath %>js/bootstrap-337/js/bootstrap.min.js"></script>
    <style type="text/css">
		.row {
		   	margin-right: -15px;
		    margin-left: -15px;
		    padding: 0;
		    
		}
		.input-xlarge{
		display:none;
		margin:2px;
	
		}
		.help-block{
		display:block;
		margin:2px;
		font-size: 20px;
	
		}
	</style>
</head>
<body>
<div class="container">
	<form class="form-horizontal "  id="edit" role="form">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
				<h3>管理员信息表</h3><hr/>
				</div>
			</div>	
				<div class="col-md-6 column">
					<div class="row clearfix">
							<div class="col-md-12 column">
								<p style="text-align: center;font-weight:900;">ID:${User.userid}</p>
								<div style="text-align: center"><img class="img-thumbnail" alt="140x140" src="<%=basePath %>/images/yuan1.png" style="height: 300px;width: 300px;"/></div>
							</div>
					</div>
				</div>
				<div class="col-md-6 column">				
					    <fieldset>			
					    <div class="control-group">					
					          <!-- Text input-->
					          <label class="control-label" for="U1" style="margin-top:35px;">账号</label>
					          <div class="controls">
					            <input class="input-xlarge" type="text" id="U1"name="usercode" placeholder="${User.usercode }">
					            <p class="help-block">${User.usercode }</p>
					          </div>
					        </div>				
					  <div class="control-group">					
					          <!-- Text input-->
					          <label class="control-label" for="U2">昵称</label>
					          <div class="controls">
					            <input class="input-xlarge" type="text" id="U2" name="username" placeholder="${User.username }">
					            <p class="help-block">${User.username }</p>
					          </div>
					        </div>
					
					    <div class="control-group">
					
					          <!-- Text input-->
					          <label class="control-label" for="U3">手机</label>
					          <div class="controls">
					            <input class="input-xlarge" type="text" id="U3" name="phone" placeholder="${User.phone}">
					            <p class="help-block">${User.phone }</p>
					          </div>
					        </div>
					
					    <div class="control-group">
					          <!-- Text input-->
					    <label class="control-label" for="U4">邮箱</label>
					    <div class="controls">
					         <input class="input-xlarge" type="email" id="U4" name="email" placeholder="${User.email }">
					         <p class="help-block" id="U4">${User.email }</p>
					   </div>
				 </div>					
			</fieldset>
		 </div>
		 </div>
	</div>
	<div class="row clearfix">
				<div class="col-md-6 column"></div>
				<div class="col-md-5 column">
					<div class="control-group">
					          <div class="controls">
					          <hr/>
					 <button type="button" class="btn btn-warning"  
					data-toggle="modal" data-target="#customerEditDialog"  onclick="editUser(${User.userid})">
					<i class="glyphicon glyphicon-edit"></i>&nbsp;修改</button>					         
				</div>			
			</div>
		</div>
	</div>
	</form>
 </div>
 <div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_u" role="form">
					<div class="form-group">
						<label for="U11" class="col-sm-2 control-label">DI:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="U11" placeholder="编号"  name="userid"  readonly="readonly" />
						</div>
					</div>
					<div class="form-group">
						<label for="U22" class="col-sm-2 control-label">账号:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="U22" placeholder="账号"  name="usercode"  readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="U33" class="col-sm-2 control-label">昵称:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="U33" placeholder="昵称" name="username" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="U44" class="col-sm-2 control-label">手机:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="U44" placeholder="电话" name="phone" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="U55" class="col-sm-2 control-label">邮箱:</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="U55" placeholder="邮箱" name="email" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="sever()">保存修改</button>
			</div>
		</div>
	</div>
</div>
 <script type="text/javascript">
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
                //修改
                function sever() {
    			layer.ready(function () {
    				$.post("<%=basePath %>/returnXg.action",
    				$("#edit_u").serialize(),
    						function(data){
    					if(data =="OK"){
    						layer.msg('修改成功!', {icon:1,time:666},function(){parent.menuFrame.location.reload(); });
    					
    					}else{
    						layer.msg('修改失败!', {icon:2,time:666},function(){location.reload();});	
    					}
    				});
		});
		
	}       

                
    </script>

</body>
</html>