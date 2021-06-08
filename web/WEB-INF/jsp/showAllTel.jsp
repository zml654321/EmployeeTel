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
</head>
<script language="javascript" type="text/javascript">
    window.onload = function(){
        var oTable = document.getElementById("table-tel");
        for(var i=1;i<oTable.rows.length;i++){
            oTable.rows[i].cells[0].innerHTML = (i);
        }
    }
</script>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>员工信息列表</small>
                </h1>
            </div>
        </div>
    </div>
    <br>
    <div class="col-lg-4 col-lg-offset-4">
        <form method="post" action="${pageContext.request.contextPath}/login/queryInfoByInfo">
            部门：
            <select name="dept_id" class="form-control" style="width: 300px">
                <option value="">请选择</option>
                <option value="0802">0802-董事会</option>
                <option value="0888">0888-总行</option>
                <option value="0802">0802-董事会办公室</option>
                <option value="0906">0906-审计部</option>
                <option value="0920">0920-信贷管理部</option>
                <option value="0913">0913-金融市场部</option>
                <option value="0999">0999-企/个金管理部</option>
                <option value="0968">0968-行政管理部</option>
                <option value="0975">0975-运营管理部</option>
                <option value="0951">0951-合规部</option>
                <option value="0937">0937-风险管理部</option>
                <option value="0944">0944-财务管理部</option>
                <option value="0826">0826-信息部</option>
                <option value="2033">2033-昆山分行</option>
                <option value="2057">2057-昆山花桥支行</option>
                <option value="2071">2071-东莞分行</option>
                <option value="2088">2088-福州分行</option>
                <option value="2606">2606-南京分行</option>
            </select>
            <br>
            员编/姓名/分机：
                <input type="text" name="info" class="form-control" style="width: 300px">
            <br>
        <input class="form-control" type="submit" style="width: 300px">
        </form>
    </div>
    <br>
    <div class="row clearfix">
        <div class="col-md-12 column">
            提交信息：${dept_id}|${info}
        </div>
        <div class="col-md-12 column">
            <table class="table table-hover table-striped" id="table-tel" style="table-layout:fixed;text-align: center">
                <thead>
                <tr>
                    <td><b>序号</b></td>
                    <td><b>服务单位</b></td>
                    <td><b>员工编号</b></td>
                    <td><b>员工姓名</b></td>
                    <td><b>岗位</b></td>
                    <td><b>职位</b></td>
                    <td><b>分机号码</b></td>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="tel" items="${requestScope.get('list')}">
                    <tr>
                        <td title="${tel.getDept_id()}">${tel.getDept_id()}</td>
                        <td title="${tel.getDept_name()}">${tel.getDept_name()}</td>
                        <td title="${tel.getStaff_id()}">${tel.getStaff_id()}</td>
                        <td title="${tel.getEmp_name()}">${tel.getEmp_name()}</td>
                        <td title="${tel.getPost()}">${tel.getPost()}</td>
                        <td title="${tel.getLevel()}">${tel.getLevel()}</td>
                        <td title="${tel.getTel()}">${tel.getTel()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
