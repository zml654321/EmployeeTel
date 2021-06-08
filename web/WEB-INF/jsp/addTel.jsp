<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>新增信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.5.1.js"></script>
</head>
<script type="text/javascript">
    function back() {
        window.location.href='${pageContext.request.contextPath}/login/login';
    }
</script>
<script type="text/javascript">
    var selId;
    var data;
    function getDeptName(val) {
        var url="${pageContext.request.contextPath}/login/queryAllDept";
        selId=val.id;
        data="";
        ajaxRequest(url,data,responseData)
    }
    function ajaxRequest(url,data,responseResult) {

    }
    function responseData() {

    }
</script>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增行员电话信息</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/tel/addTel" method="post" name="form1">
        <div class="form-group" >
            员工姓名：
            <div class="row">
                <div class="col-md-3">
                    <input type="text" name="emp_name" class="form-control" required>
                </div>
            </div>

            员工编码：
            <div class="row">
                <div class="col-md-3">
                    <input type="text" name="staff_id" class="form-control " required>
                </div>
            </div>

            <c:import url="/dept.jsp"></c:import>

            <c:import url="/position.jsp"></c:import>

            <c:import url="/post.jsp"></c:import>

            <div class="row">
                <div class="col-md-3">
                    分机：<input type="text" name="tel" class="form-control " required>
                </div>
            </div>

            <br>
            <div class="row">
                <div class="col-md-3">
                    <input type="submit" value="添加" class="form-control ">
                </div>
            </div>


        </div>

        <input type="hidden" name="enter_date">
        <input type="hidden" name="sex">
        <input type="hidden" value="0" name="operate_grade">

    </form>

</div>