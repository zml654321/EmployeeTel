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
    })
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
        document.getElementById("post1").value=html;
        console.log(html);
    }
    </script>
</head>
<body class="container">
<input type="hidden" id="post1" name="post" >
<input type="hidden" id="manger_level" name="manger_level">
职位：
<div class="row">
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
</body>
</html>
