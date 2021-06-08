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
       })
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
            document.getElementById("level").value=html;
            console.log(html);
        }
    </script>
</head>
<body class="container">
<input type="hidden" id="level" name="level">
<div>
    岗位：
    <div class="row" >
        <div class="col-md-3">
            <select id="all" class="form-control">
                <option>请选择</option>
            </select>
        </div>
        <div class="col-md-3">
            <select id="dept" class="form-control">
                <option>请选择</option>
            </select>
        </div>
        <div class="col-md-3">
            <select id="room" class="form-control">
                <option>请选择</option>
            </select>
        </div>
        <div class="col-md-3">
            <select id="post" class="form-control">
                <option>请选择</option>
            </select>
        </div>
    </div>
</div>
</body>
</html>
