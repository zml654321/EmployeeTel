<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>更新信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.5.1.js"></script>
</head>
<script type="text/javascript">
    function back() {
        window.location.href='${pageContext.request.contextPath}/login/login';
    }
    window.onload=function () {
        document.getElementById("dept_name").style.display="none";
        document.getElementById("dept_id").style.display="none";
        document.getElementById("all").style.display="none";
        document.getElementById("dept").style.display="none";
        document.getElementById("room").style.display="none";
        document.getElementById("post").style.display="none";
        document.getElementById("position_level").style.display="none";
        document.getElementById("position_name").style.display="none";
    }
    function changeDept() {
        document.getElementById("dept_name").style.display="inline";
        document.getElementById("dept_id").style.display="inline";

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
                    document.getElementById("deptName").value=$(this).val();
                    getDept_id($(this).val());
                })
            }
        })

    }
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
                document.getElementById("deptId").value=data[0].dept_no;
            }
        })
    }
    function changePost(){
        document.getElementById("all").style.display="inline";
        document.getElementById("dept").style.display="inline";
        document.getElementById("room").style.display="inline";
        document.getElementById("post").style.display="inline";
        $.ajax({
            url:"${pageContext.request.contextPath}/ajax/queryPostByLev",
            data:{lev:0},
            success:function (data) {
                if(!data) return;
                document.getElementById("dept").style.display="none";
                document.getElementById("room").style.display="none";
                document.getElementById("post").style.display="none";
                var html="<option>请选择</option>";
                var show="";
                for (var e in data){
                    html+='<option value='+data[e].id+'>'+data[e].name+'</option>';
                }
                $("#all").html(html);
                $("#all").change(function () {
                    document.getElementById("dept").style.display="none";
                    document.getElementById("room").style.display="none";
                    document.getElementById("post").style.display="none";
                    getDept($(this).val(),show);
                })
            }
        })
    }
    function getDept(before_id,show) {
        $.ajax({
            url:"${pageContext.request.contextPath}/ajax/queryPostByBefore_id",
            data:{before_id:before_id},
            success:function (data) {
                if(data.length!=0){
                    document.getElementById("dept").style.display="inline";
                }
                var html = "<option>请选择</option>";
                for (var e in data) {
                    html += '<option value=' + data[e].id + '>' + data[e].name + '</option>';
                }
                $("#dept").html(html);
                $("#dept").change(function () {
                    document.getElementById("room").style.display="none";
                    document.getElementById("post").style.display="none";
                    getRoom($(this).val(),show);
                })
            }
        })
    }
    function getRoom(before_id,show) {
        $.ajax({
            url:"${pageContext.request.contextPath}/ajax/queryPostByBefore_id",
            data:{before_id:before_id},
            success:function (data) {
                if(data.length!=0){
                    document.getElementById("room").style.display="inline";
                    var html = "<option>请选择</option>";
                    for (var e in data) {
                        html += '<option value=' + data[e].id + '>' + data[e].name + '</option>';
                    }
                    $("#room").html(html);
                    $("#room").change(function () {
                        document.getElementById("post").style.display="none";
                        getPost($(this).val());
                    })
                }else{
                    selectChange("all","dept")
                }
            }
        })
    }
    function getPost(before_id) {
        $.ajax({
            url:"${pageContext.request.contextPath}/ajax/queryPostByBefore_id",
            data:{before_id:before_id},
            success:function (data) {
                if(data.length!=0){
                    document.getElementById("post").style.display="inline";
                    var html = "<option>请选择</option>";
                    for (var e in data) {
                        html += '<option value=' + data[e].id + '>' + data[e].name + '</option>';
                    }
                    $("#post").html(html);
                    $("#post").change(function () {
                        selectChange("room","post");
                    })
                }else{
                    selectChange("dept","room")
                }
            }
        })
    }

    function selectChange(select1,select2) {
        var html="";
        var all1=document.getElementById(select1).selectedIndex;
        var allText1= document.getElementById(select1).options[all1].text;
        var all2=document.getElementById(select2).selectedIndex;
        var allText2= document.getElementById(select2).options[all2].text;
        html=html+allText1+allText2;
        document.getElementById("post1").value=html;
        console.log(html);
    }
    function changeLevel() {
        document.getElementById("position_name").style.display="inline";
        document.getElementById("position_level").style.display="inline";
        //自动加载一级菜单
        $.ajax({
            url:"${pageContext.request.contextPath}/ajax/queryAllPosition",
            success:function (data) {
                if(!data) return;
                document.getElementById("position_level").style.display="none";
                var html="<option>请选择</option>";
                for (var e in data){
                    html+='<option value='+data[e]+'>'+data[e]+'</option>';
                }
                $("#position_name").html(html);

                $("#position_name").change(function () {
                    getPosition_level($(this).val());
                })
            }
        })
    }
    function getPosition_level(name) {
        $.ajax({
            url:"${pageContext.request.contextPath}/ajax/queryPositionByName",
            data:{name:name},
            success:function (data) {
                if(data.length!=0){
                    document.getElementById("position_level").style.display="inline";
                }
                var html = "<option>请选择</option>";
                for (var e in data) {
                    html += '<option value=' + data[e].id + '>' + data[e].position_level + '</option>';
                }
                $("#position_level").html(html);
                $("#position_level").change(function () {
                    postSelect();
                    getOrder_level($(this).val());
                })
            }
        })
    }
    function getOrder_level(id) {
        $.ajax({
            url:"${pageContext.request.contextPath}/ajax/queryOrder_levelById",
            data:{id:id},
            success:function (data) {
                document.getElementById("manger_level").value=data[0].order_level;
            }
        })

    }
    function postSelect() {
        var html="";
        var all1=document.getElementById("position_name").selectedIndex;
        var allText1= document.getElementById("position_name").options[all1].text;
        var all2=document.getElementById("position_level").selectedIndex;
        var allText2= document.getElementById("position_level").options[all2].text;
        html=html+allText1+allText2;
        document.getElementById("level").value=html;
        console.log(html);
    }
</script>
<style type="text/css">
</style>
<body>
<div class="container" style="align: center">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改行员分机信息</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/tel/updateTel" method="post">
        <input type="hidden" value="${tel.getId()}" name="id">
        <input type="hidden" value="${tel.getEnter_date()}" name="enter_date">
        <input type="hidden" value="${tel.getSex()}" name="sex">
        <input type="hidden" value="${tel.getOperate_grade()}" name="operate_grade">
        <input type="hidden" value="${tel.getManger_level()}" id="manger_level" name="manger_level">
        <div class="form-group">
            员工姓名：
            <div class="row">
                <div class="col-md-3">
                    <input type="text" name="emp_name" value="${tel.getEmp_name()}" class="form-control" required>
                </div>
            </div>

            员工编码：
            <div class="row">
                <div class="col-md-3">
                    <input type="text" name="staff_id" value="${tel.getStaff_id()}" class="form-control " required>
                </div>
            </div>
            部门名称：
            <div class="row">
                <div class="col-md-3">
                    <input type="text"  id="deptName" name="dept_name" value="${tel.getDept_name()}" class="form-control " readonly required>
                </div>
                <div class="col-md-1">
                    <input type="button" value="变更" class="form-control" onclick="changeDept()">
                </div>
                <div class="col-md-3">
                    <select id="dept_name"  class="form-control">
                    <option>请选择</option>
                    </select>
                </div>
            </div>
            部门代号：
            <div class="row">
                <div class="col-md-3">
                    <input type="text" id="deptId" name="dept_id" value="${tel.getDept_id()}" class="form-control " readonly required>
                </div>
               <div class="col-md-3 col-md-offset-1">
                    <select id="dept_id"   class="form-control">
                    <option>请选择</option>
                </select>
                </div>
            </div>
            职位：
            <div class="row">
                <div class="col-md-3">
                    <input type="text" id="post1" value="${tel.getPost()}" name="level" class="form-control" readonly>
                </div>
                <div class="col-md-1">
                    <input type="button" value="变更" class="form-control" onclick="changeLevel()">
                </div>
                <div class="col-md-3">
                    <select id="position_name" class="form-control">
                        <option>请选择</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <select id="position_level"  class="form-control">
                        <option>请选择</option>
                    </select>
                </div>
            </div>

            岗位：
            <div class="row">
                <div class="col-md-3">
                    <input type="text" id="level" value="${tel.getLevel()}" name="post" readonly class="form-control">
                </div>
                <div class="col-md-1">
                    <input type="button" value="变更" class="form-control" onclick="changePost()">
                </div>
                <div class="col-md-2">
                    <select id="all" class="form-control">
                        <option>请选择</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select id="dept" class="form-control">
                        <option>请选择</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select id="room" class="form-control">
                        <option>请选择</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select id="post" class="form-control">
                        <option>请选择</option>
                    </select>
                </div>
            </div>
            分机：
            <div class="row">
                <div class="col-md-3">
                    <input type="text" name="tel" value="${tel.getTel()}" class="form-control " required>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">
                    <input  type="submit"  value="修改" class="form-control" onclick="">
                </div>
            </div>
    </form>

</div>