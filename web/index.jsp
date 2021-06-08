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
  <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.5.1.js"></script>
  <script type="text/javascript">
    function a1() {
      //所有参数：
      //url:待载入页面的url地址
      //data:待发送key/value参数
      //success:载入成功时回调函数
      //data封装了服务器返回的数据
      //status:状态
      $.ajax({
        url:"${pageContext.request.contextPath}/ajax/a1",
        data:{'name':$("#textName").val()},
        success:function (data,status) {
          alert(data);
          alert(status);
        }
      });
      //文本框中的值
      //发给服务器

      //接收服务器返回的数据
    }
  </script>
</head>
<body>
用户名：
<input type="text" id="textName" onblur="a1()"/>
</body>
</html>
