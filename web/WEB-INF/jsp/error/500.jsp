<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<%@ page import="java.io.*" %>
<html>
<body>
<h2>Oops! Exceptions occurred</h2>
<%
    response.getWriter().println("Exception: " + exception);
%>
</body>
</html>