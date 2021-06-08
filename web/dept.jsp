<%--
  Created by IntelliJ IDEA.
  User: 900038
  Date: 2021/5/11
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
    //自动加载一级菜单
    $.ajax({
    url:"${pageContext.request.contextPath}/ajax/queryAllDept",
    success:function (data) {
    if(!data) return;
    var html="<option>请选择</option>";
    for (var e in data){
    html+='<option value='+data[e].dept_name+'>'+data[e].dept_name+'</option>';
    }
    $("#dept_name").html(html);

    $("#dept_name").change(function () {
        getDept_id($(this).val());
    })
    }
    })
    })
    function getDept_id(dept_name) {
     $.ajax({
         url:"${pageContext.request.contextPath}/ajax/queryDept_idByName",
         data:{dept_name:dept_name},
         success:function (data) {
            var html="";
             for (var e in data){
                 html+='<option value='+data[e].dept_no+'>'+data[e].dept_no+'</option>';
             }
             $("#dept_id").html(html);
         }
     })
        }
    </script>
</head>

<body class="container">

<div class="row">
    <div class="col-md-3">
        部门名称：<select id="dept_name" name="dept_name"  class="form-control">
            <option>请选择</option>
        </select>
    </div>
</div>
<div class="row">
    <div class="col-md-3">
        部门代号：<select id="dept_id"  name="dept_id"  class="form-control">
        <option>请选择</option>
    </select>
    </div>
</div>
</body>
</html>
