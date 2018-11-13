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
<title>404</title>
   <link href="<%=basePath %>js/layui/css/layui.css" rel="stylesheet"/>
</head>
<body>
<div>
<p><i class="">&#xe664;</i>404.....</p>
</div>

</body>
 <script type="text/javascript" src="<%=basePath %>/js/layui/layui.js"></script>
</html>