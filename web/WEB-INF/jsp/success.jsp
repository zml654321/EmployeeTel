<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电话信息列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        td{
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        window.onload = function(){
            var oTable = document.getElementById("table-tel");
            for(var i=1;i<oTable.rows.length;i++) {
                oTable.rows[i].cells[0].innerHTML = (i);

            }
            $.post("${pageContext.request.contextPath}/ajax/a3",function (data) {
                console.log(data);
                var html="";
                for(var i=0;i<data.length;i++){
                    html+="<option value="+data[i].dept_no+">"+data[i].dept_name+"</option>"
                }
                $("#deptSelect").append(html)

            })
        }

        function getDeptTel() {
            var value=document.getElementById("deptSelect").value;
            console.log(value);
            $.post("${pageContext.request.contextPath}/ajax/a4",
                {dept_id:value},
                function (data) {
                console.log(data);
                    var html="";
                    for(var i=0;i<data.length;i++){
                        var l=i+1;
                        html+="<tr>"+
                            "<td>"+l+"</td>"+
                            "<td>"+data[i].emp_name+"</td>"+
                            "<td>"+data[i].staff_id+"</td>"+
                            "<td>"+data[i].dept_name+"</td>"+
                            "<td>"+data[i].dept_id+"</td>"+
                            "<td>"+data[i].post+"</td>"+
                            "<td>"+data[i].level+"</td>"+
                            "<td>"+data[i].tel+"</td>"+
                            "<td>" +
                                "<a href=${pageContext.request.contextPath}/tel/toUpdate?id="+data[i].id+">更改</a>|"+
                                "<a href=${pageContext.request.contextPath}/tel/deleteTelById?id="+data[i].id+"&method=post&username="+data[i].emp_name+">删除</a>"
                            + "</td>"
                            + "</tr>"
                    }
                    $("#content").html(html)
                })
        }
    </script>
</head>

<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>行内电话信息</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-1 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/tel/toAdd">新增</a>
        </div>
        <div class="col-md-2" column>
            <select class="form-control" id="deptSelect" onchange="getDeptTel()" >
                <option value="0">请选择</option>
            </select>
        </div>
        <div class="col-md-1 col-md-offset-8 column">
            <p>
                <a href="${pageContext.request.contextPath}/user/logout?name=username">
                    <span class="glyphicon glyphicon-user" aria-hidden="true">${username}</span>&nbsp;
                </a>
            </p>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped" style="table-layout: fixed" id="table-tel">
                <thead>
                <tr>
                    <th class="col-md-1">编号</th>
                    <th class="col-md-1">员工姓名</th>
                    <th class="col-md-1">员工编号</th>
                    <th class="col-md-2">部门名称</th>
                    <th class="col-md-1">部门代号</th>
                    <th class="col-md-1">职位</th>
                    <th class="col-md-1">岗位</th>
                    <th class="col-md-2">分机</th>
                    <th class="col-md-2">操作</th>
                </tr>
                </thead>

                <tbody id="content">
                <c:forEach var="tel" items="${requestScope.get('list')}">
                    <tr>
                        <td></td>
                        <td title="${tel.getEmp_name()}">${tel.getEmp_name()}</td>
                        <td title="${tel.getStaff_id()}">${tel.getStaff_id()}</td>
                        <td title="${tel.getDept_name()}">${tel.getDept_name()}</td>
                        <td title="${tel.getDept_id()}">${tel.getDept_id()}</td>
                        <td title="${tel.getPost()}">${tel.getPost()}</td>
                        <td title="${tel.getLevel()}">${tel.getLevel()}</td>
                        <td title="${tel.getTel()}">${tel.getTel()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/tel/toUpdate?id=${tel.getId()}">更改</a> |
                            <a href="${pageContext.request.contextPath}/tel/deleteTelById?id=${tel.getId()}&method=post&username=${username}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
