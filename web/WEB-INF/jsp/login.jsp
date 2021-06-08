<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div class="container" >
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
            <form class="form-signin" style="align-content: center;" action="${pageContext.request.contextPath}/login/login" method="post">
                <h2 class="form-signin-heading">电话信息系统</h2>
                <label for="inputEmail" >UserName:</label>
                <input type="text" id="inputEmail" name="username" class="form-control form-control-pl-30" placeholder="Username" required="" autofocus="">
                <label for="inputPassword" >Password:</label>
                <input type="password" id="inputPassword" name="pwd" class="form-control" placeholder="Password" required="">
                <br>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4">
                        <button class="btn btn-lg btn-primary" type="submit">Sign in</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-lg-offset-4">
            ${msg}
        </div>
    </div>
</div>
</body>
</html>